#include "scene.h"

#include <gb/gb.h>
#include <stdint.h>
#include <stdbool.h>
#include <rand.h>
#include <types.h>
#include <string.h>
#include "../res/hub_data.h"
#include "../res/hub_map.h"
#include "../res/base_floor_map.h"
#include "../res/window_maps.h"
#include "../res/Numbers.h"
#include "../res/partly_broken_bricks.h"
#include "../res/extra_sprites.h"

#define map_pos_x 1
#define base_floor_map_height 8

//TEMP
static uint8_t i; //iterator
bool rand_init;
UBYTE r;
//static window_component_struct current_top_info;
//static window_component_struct current_bot_info;

static uint8_t window_components_on_current_floor[4]; //Four upper bits top_component     -   Four lower bits bot_component

// current and old positions of the camera in pixels
uint8_t camera_y, old_camera_y;
UBYTE camera_y_clamped, old_camera_y_clamped;
static uint8_t frames_to_move, current_cam_frame, accelerate_cam_flag; 
bool game_started_flag;
bool game_ended_flag;

rect rect_list[4][8];
window_status map_components[4][4];
static uint8_t next_assignable_rect_index;

//floor gen structs
enum FLOOR_TYPE {
    REGULAR,
    BIRD,
    FLOOR_COMPLETED_FLAG
};

//walker
static UBYTE walker_byte; // 0xUFCCVVVV
static uint8_t malloc_i;
static uint8_t window_map[96];
#define FINISHED_PATH (walker_byte & 0x40)
#define CURRENT_WINDOW (walker_byte >> 4)
#define VISITED_WINDOWS walker_byte

#define TURNING_PROB 0xAF //175 (~69% nice)

//weeds/clothes position array
uint8_t clothes_position[4];
uint8_t clothes_speed; //two bits per clothes 0xDDCCBBAA
uint8_t deactivate_weeds_flag; //two bits per weed 0xDDCCBBAA
static uint8_t weeds_frame_counter;

//floor gen vars
static bool is_generated;

const window_component_struct bot_info[6] = {
    {.y_offset = 5U, .h = 2, .map = bot_map_00, .collider = {0, 0, 0, 0, INACTIVE}},
    {.y_offset = 5U, .h = 2, .map = bot_map_01, .collider = {1U, 52U, 30U, 19U, TRAVERSABLE}},

    {.y_offset = 5U, .h = 2, .map = bot_map_02, .collider = {1U, 54U, 30U, 21U, SOLID}},
    {.y_offset = 4U, .h = 3, .map = bot_map_03, .collider = {1U, 54U, 30U, 27U, SPIKEY}},
    {.y_offset = 5U, .h = 2, .map = bot_map_04, .collider = {1U, 52U, 30U, 19U, TRAVERSABLE}},
    {.y_offset = 5U, .h = 2, .map = bot_map_05, .collider = {1U, 52U, 30U, 19U, BOUNCY}},
};

const window_component_struct top_info[5] = {
    {.y_offset = 1, .h = 1, .map = top_map_00, .collider = {0, 0, 0, 0, INACTIVE}},
    {.y_offset = 1, .h = 1, .map = top_map_01, .collider = {1U, 23U, 30U, 19U, TRAVERSABLE}},
    
    {.y_offset = 1, .h = 1, .map = top_map_02, .collider = {1U, 21U, 30U, 19U, SOLID}},
    {.y_offset = 1, .h = 2, .map = top_map_03, .collider = {253U, 21U, 36U, 19U, BOUNCY}},
    {.y_offset = 1, .h = 1, .map = top_map_04, .collider = {1U, 21U, 30U, 19U, SHINGLED}},
};

const unsigned char traversable_bots[] = {0x01, 0x01, 0x05, 0x01}; //hemos quitado 0x04 porque aún no funciona //we put more instances of the parts we want with higher probability, always a power of two to avoid division when getting a rand
const unsigned char traversable_tops[] = {0x01, 0x03, 0x01, 0x01};
const unsigned char bulky_bots[] = {0x01, 0x02, 0x03, 0x02};
const unsigned char bulky_tops[] = {0x00, 0x02, 0x04, 0x02};

const unsigned char all_tops[] = {0x00, 0x01, 0x02, 0x03, 0x04, 0x01, 0x02, 0x02};
const unsigned char all_bots[] = {0x00, 0x01, 0x02, 0x03, 0x01, 0x05, 0x02, 0x02}; //hemos quitado a 0x04 porque aun no funciona

const unsigned char possible_clothes[] = {0x1F, 0x20};

void scene_init(void);
void compute_scene_frame(void);
void move_camera(void);
void set_camera(void);
void gen_new_floor(void);

void move_sprites_down(void);
void animate_weeds(void);
void add_clothes_to_rag(window_status* temp_window);

void next_map_gen_step(void);
void update_walker(void);
void fill_window(void);
void mend_incorrect_windows(void);
void fill_memory(void);

void move_rects(void);

void memcpy_rect(uint8_t wm_pos, uint8_t * p_src, uint8_t src_width, uint8_t size_bytes);

void scene_init(void){
    // Load Background tiles and then map (160 x 144)
    set_bkg_data(0, 112U, hub_data);
    set_bkg_data(112U, 13, numbers);
    set_bkg_data(0x7D, 5, partly_broken_bricks);
    set_bkg_tiles(map_pos_x, 20U, 20u, 30u, hub_map);
    camera_y = 0;
    old_camera_y = 0;
    frames_to_move = 40;
    current_cam_frame = 0;
    accelerate_cam_flag = 0;
    game_started_flag = false;
    game_ended_flag = false;
    move_bkg(map_pos_x << 3, camera_y);
    is_generated = false;

    rect ground = {0U, 152U, 0xFF, 23U, SOLID};
    rect dumpster = {103U, 146U, 35U, 32U, TRAVERSABLE};
    rect vending_machine = {132U, 146U, 32U, 49U, SOLID};
    rect ledge = {12U, 88U, 0x98, 19U, INIT_FLAG}; //prev 154
    
    next_assignable_rect_index = 0U;
    window_status empty_window_status;
    empty_window_status.components = 0x00;
    empty_window_status.status = 0x00;
    for (i = 0; i < 4; i++)
    {
        rect collider;
        collider = top_info[1].collider;
        collider.x += (3 + (i<<2)) << 3;
        collider.y += 8;
        rect_list[0][0x07 & (i<<1 | 0x01)] = collider;
        //next_assignable_rect_index = (next_assignable_rect_index + 1) & 0x07;

        collider = bot_info[1].collider;
        collider.x += (3 + (i<<2)) << 3;
        collider.y += 8;
        rect_list[0][0x07 & (i<<1)] = collider;
        //next_assignable_rect_index = (next_assignable_rect_index + 1) & 0x07;

        map_components[i][0] = empty_window_status;
        map_components[i][1] = empty_window_status;
        map_components[i][2] = empty_window_status;
        map_components[i][3] = empty_window_status;
    }
    
    //lmao stepbro you wildin
    rect_list[1][0x00] = ledge;
    rect_list[1][0x01] = dumpster;
    rect_list[1][0x02] = vending_machine;
    rect_list[1][0x03] = ground;
    rect_list[1][0x04] = ground;
    rect_list[1][0x05] = ground;
    rect_list[1][0x06] = ground;
    rect_list[1][0x07] = ground;

    rect_list[2][0x00] = ground;
    rect_list[2][0x01] = vending_machine;
    rect_list[2][0x02] = ground;
    rect_list[2][0x03] = ground;
    rect_list[2][0x04] = ground;
    rect_list[2][0x05] = ground;
    rect_list[2][0x06] = ground;
    rect_list[2][0x07] = ground;

    rect_list[3][0x00] = ground;
    rect_list[3][0x01] = ground;
    rect_list[3][0x02] = ground;
    rect_list[3][0x03] = ground;
    rect_list[3][0x04] = ground;
    rect_list[3][0x05] = ground;
    rect_list[3][0x06] = ground;
    rect_list[3][0x07] = ground;

    window_components_on_current_floor[0] = 0x11;
    window_components_on_current_floor[1] = 0x11;
    window_components_on_current_floor[2] = 0x11;
    window_components_on_current_floor[3] = 0x11;

    r = 0x00;
    rand_init = false;

    //w = (walker){.current_window = 0, .visited_windows = 0, .FINISHED_PATH = 0};
    walker_byte = 0x00;
    malloc_i = 0;

    //extra effects
    set_sprite_data(29, 8, extra_sprites);
    clothes_position[0] = 56;
    clothes_position[1] = 136;
    clothes_position[2] = 136;
    clothes_position[3] = 136;
    set_sprite_tile(16, 29);
    move_sprite(16, 10, clothes_position[0] - camera_y);
    set_sprite_tile(17, 29);
    move_sprite(17, 13, clothes_position[1] - camera_y);
    set_sprite_tile(18, 29);
    move_sprite(18, 67, clothes_position[2] - camera_y);
    set_sprite_tile(19, 29);
    move_sprite(19, 155, clothes_position[3] - camera_y);

    weeds_frame_counter = 0;
    clothes_speed = 0b11100100;
    deactivate_weeds_flag = 0;
}

void compute_scene_frame(void){
    //TEMP  -   THIS IS TO DEBUG MAP GEN, CHANGE CAMERA MOVEMENT LATER
    /*
    joy = joypad();
    if(joy & J_UP){
        //scroll up
        camera_y--;
        set_camera();
    }
    */
    if((walker_byte & 0xCF) != 0xCF){
        if(rand_init)next_map_gen_step();
    }
    move_camera();

    animate_weeds();
}

void move_camera(void){
    if(!game_started_flag) return;
    
    current_cam_frame++;
    accelerate_cam_flag++;

    if(current_cam_frame >= (frames_to_move >> 3)){
        current_cam_frame = 0;
        camera_y--;
        set_camera();
    }

    move_sprites_down();

    if(accelerate_cam_flag == 0xFF && frames_to_move > 16U){
        frames_to_move--;
    }
}

void set_camera(void){
    move_bkg(8, camera_y);

    camera_y_clamped = (((camera_y-1) >> 3) & 0x1F) >> 3;
    old_camera_y_clamped = (((old_camera_y) >> 3) & 0x1F) >> 3;
    if(camera_y_clamped != old_camera_y_clamped){
        gen_new_floor();
        old_camera_y = camera_y-1;
    }
}

void move_sprites_down(void){
    //clothes
    for(i=0; i<4; i++){
        
        if(((deactivate_weeds_flag >> (i << 1)) & 0x03)){continue;}
        if(get_sprite_tile(16 + i) > 32){
            clothes_position[0 + i] += ((clothes_speed >> (i<<1)) & 0x03) << 1;
            if((weeds_frame_counter >> 1) & 0x01){
                shadow_OAM[16 + i].y = 160; //hide the sprite without modyfying the x coord
                continue;
            }
        }

        shadow_OAM[16 + i].y = clothes_position[0 + i] - camera_y;
        if((uint8_t)(clothes_position[0 + i] - camera_y) >= 152 && (uint8_t)(clothes_position[0 + i] - camera_y) < 170){
            deactivate_weeds_flag |= 0b00000001 << (i<<1);
            clothes_speed &= ~(0b00000011 << (i<<1));
            hide_sprite(16+i);
        }
    }
}

void animate_weeds(void){
    weeds_frame_counter++;
    if(deactivate_weeds_flag != 0x00 || is_generated){
        return;
    }
    if(weeds_frame_counter >= 15){
        weeds_frame_counter = 0;

        clothes_speed = ((clothes_speed + 0b00000001) & 0b00000011)
            | ((clothes_speed + 0b00000100) & 0b00001100)
            | ((clothes_speed + 0b00010000) & 0b00110000)
            | ((clothes_speed + 0b01000000) & 0b11000000);

        set_sprite_tile(16, 29 + ((clothes_speed >> 7) & 0x01));
        set_sprite_tile(17, 29 + ((clothes_speed >> 5) & 0x01));
        set_sprite_tile(18, 29 + ((clothes_speed >> 3) & 0x01));
        set_sprite_tile(19, 29 + ((clothes_speed >> 1) & 0x01));
    }
}

void gen_new_floor(void){
    if(!rand_init) {
        initrand(r);
        rand_init = true;
    }
    //temp gen CAMBIAR POR UN WALKER
    //floor default_floor = {.windows = {rand(), rand(), rand(), rand()}, .type = REGULAR};
    //floors[camera_y_clamped] = default_floor;
    while((walker_byte & 0xCF) != 0xCF){
        //not finished yet, but we need it now, so update till we're done
        next_map_gen_step();
    }
    //reset walker to prepare next floor
    walker_byte &= 0x30;
    malloc_i = 0;
    //create new floors if needed
    if(!is_generated){
        set_bkg_tiles(map_pos_x, camera_y_clamped << 3, 20, base_floor_map_height, floor_map);
        if(camera_y_clamped == 0) is_generated = true;    
    }
    //render the info at floors[camera_y_clamped]
    uint8_t y_draw = (camera_y_clamped << 3);

    set_bkg_tiles(3, y_draw + 1, 16, 6, window_map);

    rect collider;
    window_status temp_window;
    for ( i = 0; i < 4; i++)
    {
        //optimize this cuz it needs a tweak
        //instantiate_colliders();
        collider = top_info[(uint8_t)(window_components_on_current_floor[i] >> 4)].collider;
        collider.x += (3 + (i<<2)) << 3;
        collider.y += (1 + y_draw) << 3;
        rect_list[camera_y_clamped][0x07 & (i<<1 | 0x01)] = collider;
        //next_assignable_rect_index = (next_assignable_rect_index + 1) & 0x07;

        collider = bot_info[window_components_on_current_floor[i] & 0x0F].collider;
        collider.x += (3 + (i<<2)) << 3;
        collider.y += (1 + y_draw) << 3;
        rect_list[camera_y_clamped][0x07 & (i<<1)] = collider;
        //next_assignable_rect_index = (next_assignable_rect_index + 1) & 0x07;

        //populate status map
        temp_window.components = window_components_on_current_floor[i];
        temp_window.status = 0x00;

        //put the clothes sprites on the rack if needed
        if((window_components_on_current_floor[i] & 0x0F) == 0x05){
            add_clothes_to_rag(&temp_window);
        }
        map_components[camera_y_clamped][i] = temp_window;
    }
}

void add_clothes_to_rag(window_status* temp_window){
    if(game_ended_flag) return;
    uint8_t temp_rand = rand();
    uint8_t particle_x = ((3 + (i<<2)) << 3) + 8u;
    uint8_t particle_y = (((camera_y_clamped << 3) + 5) << 3) + 17u;
    uint8_t object_sprite;
    uint8_t rack_status = 0x00;
    if((temp_rand >> 1) & 0x01){
        //try to add the component
        for(object_sprite = 0; object_sprite < 4; object_sprite++){
            if((deactivate_weeds_flag >> (object_sprite << 1)) & 0x03){
                //the sprite object is available, assign it and place it
                deactivate_weeds_flag ^= 0b00000001 << (object_sprite << 1);
                set_sprite_tile(16 + object_sprite, possible_clothes[(temp_rand & 0x01)]);
                clothes_position[object_sprite] = particle_y;
                move_sprite(16 + object_sprite, particle_x, particle_y - camera_y);
                clothes_speed &= ~(0b00000011 << (i<<1));

                rack_status = 0b00001000;
                rack_status |= object_sprite;
                break;
            }
        }
    }

    particle_x += 8;
    if((temp_rand >> 3) & 0x01){
        //try to add the component
        for(object_sprite = 0; object_sprite < 4; object_sprite++){
            if((deactivate_weeds_flag >> (object_sprite << 1)) & 0x03){
                //the sprite object is available, assign it and place it
                deactivate_weeds_flag ^= 0b00000001 << (object_sprite << 1);
                set_sprite_tile(16 + object_sprite, possible_clothes[((temp_rand>>2) & 0x01)]);
                clothes_position[object_sprite] = particle_y;
                move_sprite(16 + object_sprite, particle_x, particle_y - camera_y);
                clothes_speed &= ~(0b00000011 << (i<<1));

                rack_status |= 0b00000100;
                if((rack_status & 0b00001000) == 0x00){
                    rack_status |= object_sprite;
                }
                break;
            }
        }
    }

    //encode the clothes info into 4bit
    //    0
    //    b
    //    has Left  -   if left position has a cloth (0N/1Y)
    //    has Right -   if right position has a cloth (0N/1Y)
    //    X         -   object index of left cloth
    //    X         -   if left doesn't have any cloth it's the index of right, and if both have cloth then we pray it's the next one
    //four bits wasn't enough for encoding all info. DAMN MY HUBRIS! I SHOUDN'T HAVE CARED AS MUCH FOR REDUCING BYTES! NOW THIS IS PRONE FOR ERROR!!
    temp_window->status = (temp_window->status & 0xF0) | rack_status; 
}

void next_map_gen_step(void){
    // --------------------
    // 3 modes:
    //      1. Calculating path // done when walker_byte 0x01??????
    //      2. Filling unfilled windows // done when walker_byte 0x01??1111
    //      3. set the memory //done when walker_byte 0x11??1111
    // --------------------
    if((walker_byte & 0x40) != 0x40){
        // 1 - path is not done yet
        update_walker();
    } else if((walker_byte & 0x4F) != 0x4F){
        // 2 - windows are not filled yet
        fill_window();
    } else{
        // 2.5 - mend the window before memory assignment
        mend_incorrect_windows();
        // 3 - memory is not set yet
        fill_memory();
    }
}

void update_walker(void){
    //if the floor is new (VVVV = 0000) mark [CC] as visited and put a traversable bot and blocky top
    if(!(walker_byte & 0x0F)){
        walker_byte |= (0x01 << (CURRENT_WINDOW & 0x03));
        window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (traversable_bots[rand() & 0x03]) | ((bulky_tops[rand() & 0x03]) << 4);
        //return;
    }
    //if both left and right are filled, force up, mark foor as return and 
    else if(((CURRENT_WINDOW & 0x01) && ((VISITED_WINDOWS & 0x05) == 0x05)) || (!(CURRENT_WINDOW & 0x01) && ((VISITED_WINDOWS & 0x0A) == 0x0A))){
        walker_byte |= 0x40;
        window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (window_components_on_current_floor[CURRENT_WINDOW & 0x03] & 0x0F) | (uint8_t)((traversable_tops[(rand() & 0x03)]) << 4);   
        //return;
    }
    //choose a new direction and fill the next window
    else if(TURNING_PROB < (UBYTE)rand()){
        //go up
        walker_byte |= 0x40;
        window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (window_components_on_current_floor[CURRENT_WINDOW & 0x03] & 0x0F) | (uint8_t)((traversable_tops[(rand() & 0x03)]) << 4);
        //return;
    } else{
        //turn
        if((rand() & 0x01) && !((VISITED_WINDOWS >> ((CURRENT_WINDOW + 1) & 0x03)) & 0x01)) { //if we want to go right and right is empty
            //right
            walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
        } else if (!((VISITED_WINDOWS >> ((CURRENT_WINDOW - 1) & 0x03)) & 0x01)){ //if left is empty
            //left
            walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW - 1) & 0x03) << 4);
        } else{ //we didn't want to go right but left was already full
            //right
            walker_byte = (walker_byte & 0xCF) | (((CURRENT_WINDOW + 1) & 0x03) << 4);
        }
        walker_byte |= (0x01 << CURRENT_WINDOW);
        window_components_on_current_floor[CURRENT_WINDOW & 0x03] = (bulky_bots[rand() & 0x03]) | ((bulky_tops[rand() & 0x03]) << 4);
    }
}

void fill_window(void){
    //fill rest of windows randomly
    for ( i = 0; i < 4; i++){
        if((VISITED_WINDOWS >> i) & 0x01) {
            continue;
        }
        window_components_on_current_floor[i] = (all_bots[rand() & 0x07]) | ((all_tops[rand() & 0x07]) << 4);
        walker_byte |= (0x01 << i);
        return;
    }
}

void mend_incorrect_windows(void){
    if(malloc_i == 4){
        return;
    }
    //check for unwanted patterns in the window and change them before going to 'fill_memory'
    if(window_components_on_current_floor[malloc_i] == 0x45){
        window_components_on_current_floor[malloc_i] = 0x05; //no shingles above a cloth rack
        return;
    }
    if((window_components_on_current_floor[malloc_i] & 0x0F) == 0x03 && (map_components[camera_y_clamped][malloc_i].components & 0xF0) == 0x30){
        window_components_on_current_floor[malloc_i] &= 0xF0; //no spikes above an awning
        //window_components_on_current_floor[malloc_i] |= 0x04; //we would assign the new value here but we want 0 anyway
        return;
    }
}

void fill_memory(void){
    //if done populating the buffer set the flag byte and return
    if(malloc_i == 4){
        walker_byte |= 0x80;
        return;
    }
    //populate a window's graphics in memory buffer
    memcpy_rect((malloc_i << 2) + 16, base, 4, 12);
    memcpy_rect(malloc_i << 2, top_info[(uint8_t)(window_components_on_current_floor[malloc_i] >> 4)].map, 4, (top_info[(uint8_t)(window_components_on_current_floor[malloc_i] >> 4)].h)<<2);
    memcpy_rect((malloc_i << 2) + ((bot_info[window_components_on_current_floor[malloc_i] & 0x0F].y_offset - 1)<<4), bot_info[window_components_on_current_floor[malloc_i] & 0x0F].map, 4, (bot_info[window_components_on_current_floor[malloc_i] & 0x0F].h)<<2);
    
    malloc_i++;
}

void memcpy_rect(uint8_t wm_pos, uint8_t * p_src, uint8_t src_width, uint8_t size_bytes){
    //few assumptions, we always copy to the window map buffer, which we know the size and pointer of (uint8_t * p_dest, uint8_t dest_width). So only needed info is where in dest buffer to place the source data
    //for a generalized function add them back, but I don't need it
    static uint8_t cur_row;
    uint8_t * map_pointer = window_map + wm_pos;
    cur_row = src_width;
    uint8_t dest_next_row_start = 16U/*dest_width*/ - src_width; // only do this calc once

    while (size_bytes--) {
      *map_pointer++ = *(p_src++);
      cur_row--;
      if (cur_row == 0) {
           map_pointer += dest_next_row_start;   
           cur_row = src_width;
      }
    }
}