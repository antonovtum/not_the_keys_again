#include "player.h"
#include "scene.h"
#include "sound.h"

#include <gb/gb.h>
#include <gb/metasprites.h>
#include <stdint.h>
#include <stdbool.h>
#include "../res/PlayerSprites.h"
#include "../res/Sfx.h"
#include "../res/brick_particle.h"

#include "../res/window_maps.h"

//player died, cue in reset cinematic
bool player_dead_flag;

// The metasprite will be built starting with hardware sprite zero (the first)
#define SPR_NUM_START 0

// Metasprite tiles are loaded into VRAM starting at tile number 0
#define TILE_NUM_START 0

// mathy-math
#define MAX(X, Y) (((X) > (Y)) ? (X) : (Y))

//temp
static uint8_t frame_counter;
static uint8_t current_frame;
bool a_not_pressed;
static uint8_t i; //iterator

static uint8_t joy;
static uint8_t x_force;
static int16_t x_speed;
bool is_facing_right; // bool
static bool is_grounded;    // bool
static bool is_jumping;     // bool
static int8_t y_speed;
uint16_t player_x;
uint8_t player_y;
static uint16_t last_x;
static uint8_t last_y;
PlayerState current_state;
static uint8_t current_coyote_frames;

uint16_t score;
static uint8_t max_player_y;
static uint8_t test_max_player_y;
static uint8_t highest_visited_floor;

//#define PLAYER_FLOOR (((uint8_t)(player_y - 8)) >> 6)
#define PLAYER_FLOOR (player_y >> 6)
#define PREV_PLAYER_FLOOR (last_y >> 6)

// hurt info
#define HURT_FRAMES 30      //OLD 25
#define HURT_X_SPEED 0x0100      //OLD 8
#define HURT_Y_SPEED -8    //OLD -16
#define HURT_G 1            //OLD 2

// forces
const uint8_t jump_g = 2U;
const uint8_t fall_g = 4U; //it was 4
const uint8_t impulse = 24U; //it was 2
const int8_t jump_power = -32; //it was -35
#define COYOTE_FRAMES 4
// clamp values
#define SUB_TO_PX(X) (X >> 8)
#define PX_TO_SUB(X) (X << 8)
const uint16_t clamp_x_velocity = 0x0200; //it was 8
const int8_t clamp_y_velocity = 20U; //it was 25
// misc
#define PHYSICS_DAMPNER 2 // bits to shift right (scale down velocity)
#define PLAYER_SPRITES 24U
#define MAX_SPRITE_HEIGHT 26U

// puff sfx
static uint8_t next_free_puff;
#define FIRST_PUFF 8
#define MAX_PUFF 4
#define X_OFFSET -4
#define Y_OFFSET 8
static uint8_t puff_frame[MAX_PUFF] = {0, 0, 0, 0};

static uint8_t brick_frame;
static int8_t brick_y_speed;

static void retrieve_input(void);
static void calculate_physics(void);
void render_player(void);
static void hurt_frame(void);
void end_frame(void);
static void update_score(void);
static void calculate_final_score(void);

void render_all_particles(void);
void instanciate_puff(uint8_t x, uint8_t y, bool is_facing_right);
void instanciate_collision_puffs(void);
static void instanciate_brick_particles(void);

static void check_collisions(void);
static inline bool point_vs_rect(rect *r);

static bool r_solid_function(uint8_t epa);
static bool r_traversable_function(uint8_t epa);
static bool r_inactive_function(uint8_t epa);
static bool r_bouncy_function(uint8_t epa);
static bool r_shingled_function(uint8_t epa);
static bool r_spikey_function(uint8_t epa);
static bool r_precarious_function(uint8_t epa);
static bool r_initf_function(uint8_t epa);
static bool (*rect_functions[8])(uint8_t) = {r_solid_function, r_traversable_function, r_inactive_function, r_bouncy_function, r_shingled_function, r_spikey_function, r_precarious_function, r_initf_function};

static void make_cloth_fall(uint8_t sprite_in_OAM);
static void make_planter_fall(uint8_t sprite_in_OAM);

#define RIGHT_UP 0x11
#define RIGHT_DOWN 0x12
#define RIGHT_CENTER 0x13
#define LEFT_UP 0x21
#define LEFT_DOWN 0x22
#define LEFT_CENTER 0x23
#define CENTER_UP 0x31
#define CENTER_DOWN 0x32

void player_init(void);
void compute_player_frame(void);

static inline void switch_state(PlayerState state);

void player_init(void)
{
    player_dead_flag = false;
    //OBP0_REG = 0xE0; //11100000
    OBP0_REG = 0xE4; //11100100
    //OBP0_REG = 0xD8; //11011000
    // load player sprites into memory
    set_sprite_data(TILE_NUM_START, PLAYER_SPRITES, playerSprites);
    set_sprite_data(PLAYER_SPRITES, 3, Sfx);
    // set the player in
    frame_counter = 0;
    current_frame = 0;
    current_state = PLAYER_STATE_IDLE;
    x_force = 0U;
    x_speed = 0U;
    y_speed = 0;
    player_x = last_x = PX_TO_SUB(16U);
    player_y = last_y = 128U;
    is_facing_right = true;
    is_grounded = true;
    next_free_puff = 0;
    score = 0;
    highest_visited_floor = 1;
    max_player_y = 0;
    a_not_pressed = true;
    current_coyote_frames = 0;
    joy = 0;
    move_metasprite(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);

    set_sprite_data(0x1B, 2, brick_particle);
    set_sprite_tile(12, 0x1B);
    set_sprite_tile(13, 0x1B);
    set_sprite_tile(14, 0x1C);
    set_sprite_tile(15, 0x1C);
    brick_frame = 0;
}

void compute_player_frame(void)
{
    if(current_state == PLAYER_STATE_HURT){
        hurt_frame();
    }
    else{
        retrieve_input();

        if(player_dead_flag) return;

        calculate_physics();
    }
    
    //retrieve_input();
    //calculate_physics();
    
    check_collisions();
    if(y_speed > 0 && (current_state != PLAYER_STATE_HURT && current_state != PLAYER_STATE_FALLING)){
        switch_state(PLAYER_STATE_FALLING);
        is_grounded = false;
        is_jumping = false;
    }

    if(current_state == PLAYER_STATE_FALLING && current_coyote_frames < COYOTE_FRAMES) current_coyote_frames++;

    update_score();

    last_x = player_x;
    last_y = player_y;
    
    render_all_particles();

    render_player();
    
    end_frame();
}

static void retrieve_input(void){
    joy = joypad();
    if (joy & J_RIGHT)
    {
        if(is_grounded)switch_state(PLAYER_STATE_RUNNING);
        if (!is_facing_right && x_speed)
        {
            x_force = 0;
        }
        else
        {
            is_facing_right = true;
            x_force = impulse;
        }
    }
    else if (joy & J_LEFT)
    {
        if(is_grounded)switch_state(PLAYER_STATE_RUNNING);
        if (is_facing_right && x_speed)
        {
            x_force = 0;
        }
        else
        {
            is_facing_right = false;
            x_force = impulse;
        }
    }
    else
    {
        x_force = 0;
        if((!x_speed) && (!y_speed)) switch_state(PLAYER_STATE_IDLE);
    }
    if ((joy & J_A && a_not_pressed) && (is_grounded || current_coyote_frames < COYOTE_FRAMES) && (y_speed >= 0))
    {
        switch_state(PLAYER_STATE_JUMPING);
        play_jump_sfx();
        a_not_pressed = false;
        y_speed = jump_power;
        is_grounded = false;
        is_jumping = true;
    }
    else if ((!(joy & J_A) || y_speed > 0) && !is_grounded)
    {
        switch_state(PLAYER_STATE_FALLING);
        stop_jump_sfx();
        is_jumping = false;
    }
    if(!(joy & J_A)) a_not_pressed = true;
}

static void calculate_physics(void){
    /*
    PHYSICS
    Based on VELOCITY VERLET simplified with constant acceleration assumption (it is not constant but error accumulation is acceptable)
    */
    player_x = is_facing_right ? player_x + (x_speed) /*+ (x_force >> 2)*/ : player_x - (x_speed) /*- (x_force >> 2)*/;
    if((uint8_t)(SUB_TO_PX(player_x) - 10U) > 160U) {
        if((uint8_t)(SUB_TO_PX(player_x) - 10U) < 200) player_x = player_x - (160U << 8); //right exit
        else player_x = player_x + (160U << 8); //left exit
    }
    if (x_force)
    {
        // we should move
        x_speed = x_speed >= clamp_x_velocity ? clamp_x_velocity : x_speed + x_force;
    }
    else
    {
        // we should slow down
        x_speed = x_speed <= 0 ? 0 : MAX(0, x_speed - (impulse<<1));
    }

    player_y += (y_speed >> (PHYSICS_DAMPNER + 1)) + ((is_jumping ? jump_g : fall_g) >> 2);
    //player_y = (uint8_t)(player_y - camera_y);

    y_speed = y_speed >= clamp_y_velocity ? clamp_y_velocity : y_speed + (is_jumping ? jump_g : fall_g);
}

void render_player(void){
    //TO RENDER THE SPRITE WE NEED THE PLAYER POS, DIRECTION, AND METASPRITE FRAME
    //current_frame = 0;
    //current_state = 4;
    if(!player_dead_flag && (uint8_t)(player_y - camera_y) > 160U) {
        player_dead_flag = true;
        game_ended_flag = true;
        calculate_final_score();
        stop_sfx();

        //stop player execution
        hide_sprites_range(0, 20);
        return;
    }
    if(current_state == PLAYER_STATE_HURT && (frame_counter & 0x02)){
        hide_metasprite(metasprites_states[current_state][current_frame], 0);
        hide_metasprite(metasprites_states[current_state][current_frame], 4);
        if(frame_counter & 0x01)play_hurt_sfx();
        return;
    }
    //if(current_state == PLAYER_STATE_RUNNING && (current_frame == 1 || current_frame == 4)) play_step_sfx();
    is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, SUB_TO_PX(player_x), (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, SPR_NUM_START, SUB_TO_PX(player_x), (uint8_t)(player_y - camera_y));
    if((uint8_t)(SUB_TO_PX(player_x)) > 160U) {
        if((uint8_t)(SUB_TO_PX(player_x)) < 200) is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) - 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) - 160, (uint8_t)(player_y - camera_y)); //right exit
        else is_facing_right?move_metasprite(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) + 160U, (uint8_t)(player_y - camera_y)): move_metasprite_vflip(metasprites_states[current_state][current_frame], TILE_NUM_START, 4, SUB_TO_PX(player_x) + 160, (uint8_t)(player_y - camera_y)); //left exit
    } else{
        hide_metasprite(metasprites_states[current_state][current_frame], 4);
    }

    if((uint8_t)(player_y - camera_y) < MAX_SPRITE_HEIGHT && !player_dead_flag){
        camera_y -= MAX_SPRITE_HEIGHT - ((uint8_t)(player_y - camera_y));
    }
}

void render_all_particles(void){
    //render all active puffs
    for(i = 0; i < MAX_PUFF; i++){
        if(puff_frame[i] == 0){
            hide_sprite(FIRST_PUFF + i);
            continue;
        }
        set_sprite_tile(FIRST_PUFF + i, PLAYER_SPRITES - 1 + (puff_frame[i] >> 2));
        puff_frame[i] = (puff_frame[i] + 1) & 0x0f; //puff_frame[i]++ mod 16 
    }

    //brick particles
    if(brick_frame == 0){
        hide_sprites_range(12, 16);
    }
    else{
        brick_frame--;
        scroll_sprite(12, 1, brick_y_speed>>1);
        scroll_sprite(13, -1, brick_y_speed>>1);
        scroll_sprite(14, 1, 1);
        scroll_sprite(15, -1, 1);
        brick_y_speed++;
    }

    //check if we need to instantiate a new puff
    if(current_state != PLAYER_STATE_RUNNING) return;
    if((frame_counter != 0) || (!(current_frame == 0 || current_frame == 3))) return;

    //we need to instanciate a new puff
    instanciate_puff(SUB_TO_PX(player_x), player_y, is_facing_right);
    // i = FIRST_PUFF + next_free_puff;
    // set_sprite_tile(i, PLAYER_SPRITES);
    // set_sprite_prop(i, get_sprite_prop(i) & 0xDF); // reset the flip
    // puff_frame[next_free_puff] = 4;
    // move_sprite(i, SUB_TO_PX(player_x) + X_OFFSET, (uint8_t)((player_y + Y_OFFSET) - camera_y));
    // if(!is_facing_right) set_sprite_prop(i, S_FLIPX); //flip if facing left
    // //go to next puff
    // next_free_puff = (next_free_puff + 1) & 0x03;
}

void instanciate_puff(uint8_t x, uint8_t y, bool is_facing_right){
    uint8_t i = FIRST_PUFF + next_free_puff;
    set_sprite_tile(i, PLAYER_SPRITES);
    set_sprite_prop(i, get_sprite_prop(i) & 0xDF); // reset the flip
    puff_frame[next_free_puff] = 4;
    move_sprite(i, x + X_OFFSET, (uint8_t)((y + Y_OFFSET) - camera_y));
    if(!is_facing_right) set_sprite_prop(i, S_FLIPX); //flip if facing left
    //go to next puff
    next_free_puff = (next_free_puff + 1) & 0x03;
}

void instanciate_collision_puffs(void){
    instanciate_puff(SUB_TO_PX(player_x), player_y, false);
    instanciate_puff(SUB_TO_PX(player_x), player_y, true);
    // //we need to instanciate a new puff
    // uint8_t i = FIRST_PUFF + next_free_puff;
    // set_sprite_tile(i, PLAYER_SPRITES);
    // set_sprite_prop(i, get_sprite_prop(i) & 0xDF); // remove flip
    // puff_frame[next_free_puff] = 4;
    // move_sprite(i, SUB_TO_PX(player_x) + X_OFFSET - 8U, (uint8_t)((player_y + Y_OFFSET) - camera_y));
    // //go to next puff
    // next_free_puff = (next_free_puff + 1) & 0x03;
    
    // i = FIRST_PUFF + next_free_puff;
    // set_sprite_tile(i, PLAYER_SPRITES);
    // set_sprite_prop(i, get_sprite_prop(i) | 0x20); // add flip
    // puff_frame[next_free_puff] = 4;
    // move_sprite(i, SUB_TO_PX(player_x) + X_OFFSET + 8U, (uint8_t)((player_y + Y_OFFSET) - camera_y));
    // //go to next puff
    // next_free_puff = (next_free_puff + 1) & 0x03;
}

static void instanciate_brick_particles(void){
    //set tiles
    uint8_t particle_x = ((3 + (i<<1 & 0x0C)) << 3) + 14u;
    uint8_t particle_y = (((PLAYER_FLOOR << 3) + 1 + ((~i & 0x01) << 2)) << 3) - camera_y + 16u;
    move_sprite(12, particle_x, particle_y);
    move_sprite(13, particle_x, particle_y);
    move_sprite(14, particle_x, particle_y);
    move_sprite(15, particle_x, particle_y);
    brick_frame = 10;
    brick_y_speed = -5;
}

static void hurt_frame(void){
    if(frame_counter >= HURT_FRAMES){
        switch_state(PLAYER_STATE_FALLING);
        stop_hurt_sfx();
        return;
    }
    player_x = is_facing_right ? player_x - (x_speed) : player_x + (x_speed);
    player_y += (y_speed >> PHYSICS_DAMPNER);
    y_speed = y_speed >= clamp_y_velocity ? clamp_y_velocity : y_speed + HURT_G;
}

void end_frame(void){
    if(frame_counter == (uint8_t)(metasprites_speeds[current_state][current_frame])){
        frame_counter = 0;
        current_frame++;
        if(current_frame == frames_in_state[current_state]){current_frame = 0;}
    }else{
        frame_counter++;
    }

    if(!rand_init){
        r = r ^ DIV_REG ^ (current_frame << frame_counter);
    }
}

static inline void switch_state(PlayerState state){
    if(current_state == state) {return;}
    if(current_state == PLAYER_STATE_FALLING){instanciate_collision_puffs();}
    frame_counter = 0;
    current_frame = 0;
    current_state = state;
}

//static uint8_t player_upper_floor;

static void check_collisions(void){
    rect *r;
    for(i=0; i<8; i++){
        r = &rect_list[PLAYER_FLOOR][i];
        if(r->type == INACTIVE) continue;
        if(!point_vs_rect(r)) {
            continue;
        }
        //we got a collision!!! see what area the prev point is in
        uint8_t external_point_area = 0x00;
            // 0x00000000 right-most four bits to denote V area, left-most four bits to denote H area
            // 1 -> right   / up
            // 2 -> left    / down
            // 3 -> center
        external_point_area |= ((uint8_t)SUB_TO_PX(last_x) >= (r->x + r->size_x)) ? 0x10 : ((uint8_t)SUB_TO_PX(last_x) <= r->x) ? 0x20 : 0x30;        
        external_point_area |= (last_y <= (r->y - r->size_y)) ? 0x01 : (last_y >= r->y) ? 0x02 : 0x03;

        if((player_y > last_y) ? (player_y - last_y) > 50 : (last_y - player_y) > 50){
            external_point_area = (external_point_area & 0xF0) + 0x02; //check for overflow height
        }

        if(rect_functions[r->type](external_point_area)) continue;

        uint8_t rx, ry;        
        switch (external_point_area)
        {
        case RIGHT_UP: // RIGHT - UP
            rx = r->x + r->size_x;
            ry = r->y - r->size_y;
            if((ry-player_y)*((uint8_t)SUB_TO_PX(last_x) - (uint8_t)SUB_TO_PX(player_x)) < (last_y - player_y)*(rx-(uint8_t)SUB_TO_PX(player_x))){
                //horizontal
                player_x = (uint16_t)PX_TO_SUB(r->x + r->size_x + 1);
                //x_speed = 0;
            } else{
                //vertical
                player_y = r->y - r->size_y - 1;
                is_grounded = true;
                current_coyote_frames = 0;
                y_speed = 0;
            }
            break;
        
        case RIGHT_DOWN: // RIGHT - DOWN
            rx = r->x + r->size_x;
            ry = r->y;
            if((ry-player_y)*((uint8_t)SUB_TO_PX(last_x) - (uint8_t)SUB_TO_PX(player_x)) > (last_y - player_y)*(rx-(uint8_t)SUB_TO_PX(player_x))){
                //horizontal
                player_x = (uint16_t)PX_TO_SUB(r->x + r->size_x + 1);
                //x_speed = 0;
            } else{
                //vertical
                player_y = r->y + 1;
                y_speed = 0;
                //play_bump_sfx();
            }
            break;

        case RIGHT_CENTER: // RIGHT - CENTER
            player_x = (uint16_t)PX_TO_SUB(r->x + r->size_x + 1);
            //x_speed = 0;
            break;

        case LEFT_UP: // LEFT - UP
            rx = r->x;
            ry = r->y - r->size_y;
            if((ry-player_y)*((uint8_t)SUB_TO_PX(last_x) - (uint8_t)SUB_TO_PX(player_x)) > (last_y - player_y)*(rx-(uint8_t)SUB_TO_PX(player_x))){
                //horizontal
                player_x = (uint16_t)PX_TO_SUB(r->x - 1);
                //x_speed = 0;
            } else{
                //vertical
                player_y = r->y - r->size_y - 1;
                is_grounded = true;
                current_coyote_frames = 0;
                y_speed = 0;
            }
            break;

        case LEFT_DOWN: // LEFT - DOWN
            rx = r->x;
            ry = r->y;
            if((ry-player_y)*((uint8_t)SUB_TO_PX(last_x) - (uint8_t)SUB_TO_PX(player_x)) < (last_y - player_y)*(rx-(uint8_t)SUB_TO_PX(player_x))){
                //horizontal
                player_x = (uint16_t)PX_TO_SUB(r->x - 1);
                //x_speed = 0;
            } else{
                //vertical
                player_y = r->y + 1;
                y_speed = 0;
                //play_bump_sfx();
            }
            break;

        case LEFT_CENTER: // LEFT - CENTER
            player_x = (uint16_t)PX_TO_SUB(r->x - 1);
            //x_speed = 0;
            break;

        case CENTER_UP: // CENTER - UP
            player_y = r->y - r->size_y - 1;
            is_grounded = true;
            current_coyote_frames = 0;
            y_speed = 0;
            break;

        case CENTER_DOWN: // CENTER - DOWN
            player_y = r->y + 1;
            y_speed = 0;
            //play_bump_sfx();
            break;
        
        default:
            break;
        }
    }
}

static void update_score(void){
    //if we reach a new floor update the score
    if((PREV_PLAYER_FLOOR != PLAYER_FLOOR) && PLAYER_FLOOR == ((highest_visited_floor - 1) & 0x03)){
        score += 4;
        highest_visited_floor = PLAYER_FLOOR;
        max_player_y = (uint8_t)((PREV_PLAYER_FLOOR << 6) - player_y);
        return;
    }
    //if we are not on the highest floor we've been don't bother checking height
    if(PLAYER_FLOOR != highest_visited_floor) return;
    //check if we are the highest we've been
    test_max_player_y = (uint8_t)((((PLAYER_FLOOR + 1) & 0x03) << 6) - player_y);
    if(max_player_y < test_max_player_y){
        max_player_y = test_max_player_y;
    }
}

static void calculate_final_score(void){
    score += (max_player_y >> 4);
}

static inline bool point_vs_rect(rect *r){
    return ((uint8_t)SUB_TO_PX(player_x) >= r->x && player_y <= r->y && (uint8_t)SUB_TO_PX(player_x) <= (r->x + r->size_x) && player_y >= (r->y - r->size_y));
}

//-------------------------------------------------------
//  collider functions
//-------------------------------------------------------

static bool r_solid_function(uint8_t epa){
    if(epa == CENTER_DOWN){
        //check the component status at that placement
        uint8_t component_at_r;
        bool is_upper = i & 0x01 == 0x01;
        component_at_r = is_upper ? map_components[PLAYER_FLOOR][i>>1].components >> 4 : map_components[PLAYER_FLOOR][i>>1].components & 0x0F;
        if(component_at_r == 2){
            if(is_upper){
                if((map_components[PLAYER_FLOOR][i>>1].status >> 4) == 0){
                    play_bump_sfx();
                    set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 1, 4, 1, top_map_02_broken);
                    map_components[PLAYER_FLOOR][i>>1].status |= 0x10;
                    return false;
                }
                instanciate_brick_particles();
                play_break_sfx();
                set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 1, 4, 1, top_map_00);
                map_components[PLAYER_FLOOR][i>>1].components = map_components[PLAYER_FLOOR][i>>1].components & 0x0F;
                map_components[PLAYER_FLOOR][i>>1].status = map_components[PLAYER_FLOOR][i>>1].status & 0x0F;
                rect_list[PLAYER_FLOOR][i].type = INACTIVE;
            } else {
                if((map_components[PLAYER_FLOOR][i>>1].status & 0x0F) == 0){
                    play_bump_sfx();
                    set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 5, 4, 2, bot_map_02_broken);
                    map_components[PLAYER_FLOOR][i>>1].status |= 0x01;
                    return false;
                }
                instanciate_brick_particles();
                play_break_sfx();
                set_bkg_tiles(3 + (i<<1 & 0x0C), (PLAYER_FLOOR << 3) + 5, 4, 2, bot_map_00);
                map_components[PLAYER_FLOOR][i>>1].components = map_components[PLAYER_FLOOR][i>>1].components & 0xF0;
                map_components[PLAYER_FLOOR][i>>1].status = map_components[PLAYER_FLOOR][i>>1].status & 0xF0;
                rect_list[PLAYER_FLOOR][i].type = INACTIVE;
            }
            //update the map status
            //change the sprite
        }
    }
    return false;
}
static bool r_traversable_function(uint8_t epa){
    return (bool)(epa != CENTER_UP || (joy & J_DOWN));
}
static bool r_inactive_function(uint8_t epa){
    return true;
}
static bool r_bouncy_function(uint8_t epa){
    if(epa == CENTER_UP){
        switch_state(PLAYER_STATE_JUMPING);
        play_boing_sfx();
        y_speed = (int8_t)(-45);
        is_grounded = false;
        is_jumping = true;

        //check if it's rack
        uint8_t status_of_rack;
        if(i & 0x01 == 0x01) {return true;}
        //check the status for clothes
        status_of_rack = map_components[PLAYER_FLOOR][i>>1].status & 0x0F;
        //4bit cloth encoding:
        //    0
        //    b
        //    has Left  -   if left position has a cloth (0N/1Y)
        //    has Right -   if right position has a cloth (0N/1Y)
        //    X         -   object index of left cloth
        //    X         -   if left doesn't have any cloth it's the index of right, and if both have cloth then we pray it's the next one
        //four bits wasn't enough for encoding all info. DAMN MY HUBRIS! I SHOUDN'T HAVE CARED AS MUCH FOR REDUCING BYTES! NOW THIS IS PRONE FOR ERROR!!
        if(status_of_rack == 0x00){
            return true;
        }
        if((status_of_rack & 0b00001100) == 0b00001100){
            //try to move both
            //clothes_position[status_of_rack & 0x03] += 5;
            make_cloth_fall(status_of_rack & 0x03);
            //if((deactivate_weeds_flag >> (((status_of_rack + 1) & 0x03) << 1)) & 0x03 != 0x01*){
            make_cloth_fall((status_of_rack + 1) & 0x03);
            //}
        } else{
            //clothes_position[status_of_rack & 0x03] += 5;
            make_cloth_fall(status_of_rack & 0x03);
        }
        map_components[PLAYER_FLOOR][i>>1].status &= 0xF0;
    }
    return true;
}

static void make_cloth_fall(uint8_t sprite_in_OAM){
    clothes_speed |= (0b00000001 << ((sprite_in_OAM)<<1));
    set_sprite_tile(16 + sprite_in_OAM, get_sprite_tile(16 + sprite_in_OAM) + 2);
}

static bool r_shingled_function(uint8_t epa){
    if(epa == CENTER_UP){
        switch_state(PLAYER_STATE_HURT);
        //y_speed = 10;
        x_speed = 0;
        return true;
    }
    if(epa == CENTER_DOWN){
        play_bump_sfx();
    }
    return false;
}
static bool r_spikey_function(uint8_t epa){
    if(epa == CENTER_UP){
        switch_state(PLAYER_STATE_HURT);
        y_speed = (int8_t)(HURT_Y_SPEED);
        x_speed = HURT_X_SPEED;
        return true;
    }
    if(epa == CENTER_DOWN){
        play_bump_sfx();
    }
    return false;
}

static bool r_precarious_function(uint8_t epa){
    if(epa == CENTER_UP){
        uint8_t status_of_planter = map_components[PLAYER_FLOOR][i>>1].status & 0x0F;
        uint8_t planter_sprite = status_of_planter >> 3;
        status_of_planter &= 0x07;
        if(!status_of_planter){
            // first time the planter has been touched
            map_components[PLAYER_FLOOR][i>>1].status |= 0x01;
            make_planter_fall(planter_sprite);
        } 
        // else{
        //     status_of_planter = ((status_of_planter + 1) & 0x07);  
        //     if (!status_of_planter)
        //     {
                
        //         make_planter_fall(planter_sprite);
        //     }
            
        //     map_components[PLAYER_FLOOR][i>>1].status = (map_components[PLAYER_FLOOR][i>>1].status & 0xF8)
        //         | status_of_planter;
        // }
        return false;
    }
    return true;
}

static void make_planter_fall(uint8_t sprite_in_OAM){
    // planters_drop_flag |= sprite_in_OAM ? 0x10 : 0x01;
    planters_drop_flag[sprite_in_OAM] |= (PLAYER_FLOOR << 6) 
        | ((i >> 1) << 4) 
        | 0b00001000;
}

static bool r_initf_function(uint8_t epa){
    game_started_flag = epa == CENTER_UP;
    return (bool)(epa != CENTER_UP || (joy & J_DOWN));
}