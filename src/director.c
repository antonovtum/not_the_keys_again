#include <gb/gb.h>
#include <stdint.h>
#include <stdlib.h>
#include <gb/metasprites.h>
#include "scene.h"
#include "sound.h"
#include "player.h"
#include "director.h"

#include "../res/PlayerSprites.h"
#include "../res/PlayerSprites_cinematic.h"
#include "../res/Thought_bubble.h"
#include "../res/base_floor_map.h"

// The metasprite will be built starting with hardware sprite zero (the first)
#define SPR_NUM_START 0

// Metasprite tiles are loaded into VRAM starting at tile number 0
#define TILE_NUM_START 0

const unsigned char cloud_tiles[] = {
    
    0xE0,0xE0,0x18,0x18,0x07,0x07,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
    0x07,0x07,0x18,0x18,0xE0,0xE0,0x00,0x00,
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
};
const unsigned char cloud_map[] = {
    0x70, 0x71, 0x70, 0x71, 0x70, 0x71, 0x70, 0x71,
    0x70, 0x71, 0x70, 0x71, 0x70, 0x71, 0x70, 0x71,
    0x70, 0x71, 0x70, 0x71, 0x70, 0x71, 0x70, 0x71,
    0x70, 0x71, 0x70, 0x71, 0x70, 0x71, 0x70, 0x71
};
const unsigned char open_window_tiles[] =
{
  0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
  0x80,0x00,0xC0,0x0C,0xC0,0x3C,0x80,0xFC,
  0x80,0xFC,0x80,0xFC,0x80,0xFC,0x80,0xFC,
  0x80,0xFC,0x80,0xFC,0x80,0xFC,0x80,0xFC,
  0x80,0xFC,0x98,0xFC,0x88,0xFC,0x88,0xFC,
  0x88,0xFC,0x80,0xFC,0x80,0xFC,0x80,0xFC,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0xFC,0xFF,
  0xFF,0xFF,0xF0,0xFF,0xC0,0xFF,0x00,0xFF,
  0xFF,0xFF,0xFF,0xFF,0xFF,0xFF,0x3F,0xFF,
  0xFF,0xFF,0x0F,0xFF,0x03,0xFF,0x00,0xFF,
  0xC0,0xFC,0x30,0xFC,0xDC,0x3C,0x40,0xC0,
  0x00,0xC0,0x00,0x00,0x00,0x00,0x00,0x00
};
const unsigned char open_window_map[] = {
    0x11, 0x12, 0x12, 0x72,
    0x04, 0x5A, 0x5A, 0x73,
    0x04, 0x61, 0x61, 0x74,
    0x04, 0x75, 0x76, 0x73,
    0x28, 0x29, 0x29, 0x77
};

static uint8_t frame_counter = 0;
static uint8_t i;

static uint8_t current_camera_y;
static uint8_t prev_camera_y;
static bool is_generated;

static uint8_t max_scan;
static uint8_t cloud_cut_scan;

#define SUB_TO_PX(X) (X >> 8)
#define PX_TO_SUB(X) (X << 8)

void play_intro_cinematic(void);

#define finish_frame(X) if(finish_frame_inner(X)){return;}
#define finish_frame_with_animation(X) if(finish_frame_with_animation_inner(X)){return;}
bool finish_frame_inner(uint8_t count);
bool finish_frame_with_animation_inner(uint8_t count);

void screen_shake(uint8_t frames, const metasprite_t* player_frame);
void pan_up(uint8_t dy);
void pan_cloud(void);

void VBL_interrupt(void) {
    //move_win(7, 0);
    SHOW_WIN;
    LYC_REG = cloud_cut_scan; 
    BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_WHITE, DMG_WHITE, DMG_WHITE); 
}
void LCD_interrupt(void) {
    if (LY_REG < 144) {
        if (LY_REG == max_scan)
        {
            HIDE_WIN;
            WX_REG = 160; //THIS IS TO COVER A BUG ON THE DMG!!! REMOVE IT FOR THE GBC VERSION
            //LYC_REG = cloud_cut_scan;
        } else if (LY_REG == cloud_cut_scan -6)
        {
            LYC_REG = max_scan;
            //move_win(7, cloud_cut_scan);
            BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY, DMG_BLACK); 
        }
    }
    // if (LY_REG < 144) {
    //     // HIDE_WIN;
    //     // WX_REG = 160; //THIS IS TO COVER A BUG ON THE DMG!!! REMOVE IT FOR THE GBC VERSION
    //     // BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY, DMG_BLACK); 
    //     if (LYC_REG == cloud_cut_scan - 1)
    //     {
    //         HIDE_WIN;
    //         WX_REG = 160; //THIS IS TO COVER A BUG ON THE DMG!!! REMOVE IT FOR THE GBC VERSION
    //         BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY, DMG_BLACK); 
    //     }
    // }
}

//if there's enough space also add reset ending cinematic

void play_intro_cinematic(void){
    //init grphics
    SHOW_BKG; SHOW_SPRITES; HIDE_WIN;

    //load map
    load_map();

    //load character
    player_init();
    //add new player frames
    set_sprite_data(37, 10, playerSprite_extra);
    set_sprite_data(47, 23, thought_bubble);
    set_bkg_data(0x70, 2, cloud_tiles);
    set_bkg_data(0x72, 6, open_window_tiles);
    set_bkg_tile_xy(0, 17, 0x61);
    set_bkg_tile_xy(0, 16, 0x6D);
    set_bkg_tile_xy(21, 17, 0x61);
    set_bkg_tile_xy(21, 16, 0x6C);
    set_bkg_tile_xy(0, 15, 0x4D);
    // MOVE CHARACTER TO DOOR
    player_x = 0;
    move_metasprite(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
    current_state = PLAYER_STATE_RUNNING;

    //move fast
    for (i = 0; i < 42; i++){
        player_x += 1<<8;

        finish_frame_with_animation(1)
    }
    //move slow
    for (i = 0; i < 36; i++)
    {
        if (frame_counter & 0x01)
        {
            player_x += 1<<8;
        }
        
        finish_frame_with_animation(1)
    }

    current_state = PLAYER_STATE_IDLE;
    finish_frame_with_animation(15)
    is_facing_right = false;
    finish_frame_with_animation(26)

    // SHIFT FOR KEYS
    move_metasprite_vflip(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);

    for (i=0; i<6; i++){
        move_metasprite(key_left_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);

        finish_frame(8)

        move_metasprite(key_left_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);

        finish_frame(8)
    }
    for (i=0; i<6; i++){
        move_metasprite(key_right_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);

        finish_frame(8)

        move_metasprite(key_right_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);

        finish_frame(8)
    }

    current_state = PLAYER_STATE_IDLE;
    is_facing_right = false;
    finish_frame_with_animation(20)
    
    // THOUGHT BUBBLE ANIMATION

    uint8_t bubble_x, bubble_y;
    bubble_x = (uint8_t)SUB_TO_PX(player_x) - 4;
    bubble_y = player_y - 7; // 11
    OBP1_REG = DMG_PALETTE(DMG_WHITE, DMG_WHITE, DMG_DARK_GRAY, DMG_BLACK);
    set_sprite_tile(20, 59);
    set_sprite_prop(20, 0b00010000);
    move_sprite(20, bubble_x, bubble_y);
    finish_frame_with_animation(3)
    set_sprite_tile(20, 60);
    move_sprite(20, bubble_x, bubble_y - 2);
    finish_frame_with_animation(3)
    set_sprite_tile(20, 61);
    move_sprite(20, bubble_x, bubble_y - 4);
    finish_frame(3)

    bubble_x = (uint8_t)SUB_TO_PX(player_x);
    bubble_y = player_y - 14;
    move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y);
    finish_frame(4)
    move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 1);
    finish_frame(4)
    move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 2);
    finish_frame(4)
    move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 3);
    finish_frame(8)
    move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
    finish_frame(90)

    move_metasprite(bubble_empty, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
    finish_frame(15)
    move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
    finish_frame(15)
    move_metasprite(bubble_empty, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
    finish_frame(15)
    move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
    finish_frame(15)
    move_metasprite(bubble_empty, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
    finish_frame(20)
    move_metasprite(bubble_key, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
    finish_frame(30)
    move_metasprite(bubble_empty, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);

    finish_frame(120)

    hide_metasprite(bubble_empty, 20);
    finish_frame(30)

    move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y);
    finish_frame(4)
    move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 1);
    finish_frame(4)
    move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 2);
    finish_frame(4)
    move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), bubble_y - 3);
    finish_frame(8)
    move_metasprite(bubble_qmark, 0, 20, (uint8_t)SUB_TO_PX(player_x), player_y -16);
    finish_frame(120)

    // SHUFFLE KEYS AGAIN
    screen_shake(10, idle_metasprites[0]);
    hide_metasprite(bubble_qmark, 20);

    for (i=0; i<6; i++){
        move_metasprite(key_left_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
        finish_frame(4)
        move_metasprite(key_left_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
        finish_frame(4)
    }
    for (i=0; i<6; i++){
        move_metasprite(key_right_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
        finish_frame(4)
        move_metasprite(key_right_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
        finish_frame(4)
    }
    for (i=0; i<6; i++){
        move_metasprite(key_left_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
        finish_frame(4)
        move_metasprite(key_left_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
        finish_frame(4)
    }

    screen_shake(10, idle_metasprites[0]);

    // GO TO DOOR
    move_metasprite(pull_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-2, player_y);
    finish_frame(1)
    move_metasprite(pull_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-4, player_y);
    finish_frame(1)
    move_metasprite(pull_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-6, player_y);
    finish_frame(1)

    // PULL
    for (uint8_t j = 0; j < 4; j++)
    {
        move_metasprite(pull_0, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-9, player_y);        
        finish_frame(15)
        for (i = 0; i < 4; i++)
        {
            move_metasprite(pull_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-9, player_y);        
            finish_frame(2)
            move_metasprite(pull_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-8, player_y);        
            finish_frame(2)
        }
    }
    for (i = 0; i < 6; i++)
    {
        move_metasprite(pull_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-9, player_y);        
        finish_frame(2)
        move_metasprite(pull_1, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x)-8, player_y);        
        finish_frame(2)
    }
    finish_frame(2)

    // FALL BACK
    player_x = player_x - (9<<8);
    move_metasprite_vflip(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
    int8_t y_speed = 9; //8
    for (i = 0; i < 60; i++)
    {
        if (frame_counter & 0x01)
        {
            player_x += 1<<8;
            player_y -= (y_speed >> 2);
        }
        if ((frame_counter & 0x03) == 0x02)
        {
            y_speed--;
        }

        switch ((frame_counter >> 2) & 0x03)
            {
            case 0x00:
                move_metasprite_vflip(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
                break;
            case 0x01:
                /* code */
                move_metasprite_hvflip(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y + 16);
                break;
            case 0x02:
                /* code */
                move_metasprite_hflip(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y + 16);
                break;
            case 0x03:
                /* code */
                move_metasprite(fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
                break;
            }
        finish_frame(1)
    }
    
    hide_metasprite(fall_metasprites[0], SPR_NUM_START);
    player_y += 12;
    // move_metasprite(fallen, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);

    screen_shake(20, fallen);

    finish_frame(70)

    // GET UP
    y_speed = 10;
    for (i = 0; i < 60; i++){
        if (frame_counter & 0x01)
        {
            player_y -= (y_speed >> 2);
            move_metasprite(y_speed > 0?jump_metasprites[0]:fall_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
        }
        if ((frame_counter & 0x03) == 0x02)
        {
            y_speed--;
        }
        finish_frame(1)
    }
    move_metasprite(idle_metasprites[0], TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
    finish_frame(35)
    current_state = PLAYER_STATE_RUNNING;
    is_facing_right = false;
    for (i = 0; i < 36; i++)
    {
        if (frame_counter & 0x01)
        {
            player_x -= 1<<8;
        }
        
        finish_frame_with_animation(1)
    }
    current_state = PLAYER_STATE_IDLE;
    finish_frame_with_animation(20)
    is_facing_right = true;
    finish_frame_with_animation(10)

    // LOOK UP
    move_metasprite(look_up, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);

    current_camera_y = camera_y;
    prev_camera_y = current_camera_y;
    is_generated = false;
    for (i = 1; i < 64; i++)
    {
        pan_up(i>>2);
        finish_frame(1)
    }
    for (i = 1; i < 40; i++)
    {
        pan_up(16);
        finish_frame(1)
    }
    
    pan_cloud();

    for (i = 64; i > 3; i--)
    {
        if (i == 20)
        {
            set_bkg_tiles(15, 25, 4, 5, open_window_map);
        }
        
        pan_up(i>>2);
        finish_frame(1)
    }
    fill_bkg_rect(1, 16, 20, 7, 0);
    for (i = 1; i < 60; i++)
    {
        if (i & 0x01)
        {
            pan_up(1);
        }
        finish_frame(1)
    }

    finish_frame(200)

    i = 0;
    while (1)
    {
        move_metasprite((i & 0x01) ? button_1 : button_2, 0, 20, 150, 134);
        finish_frame(50)
        i++;
    }
}

// inline void finish_frame(uint8_t count){
//     if (finish_frame_inner(count))
//     {
//         return;
//     }
// }

bool finish_frame_inner(uint8_t count){
    uint8_t iterator;
    unsigned char joy = 0x00;
    for ( iterator = 0; iterator < count; iterator++)
    {
        joy = joypad();
        if (joy & (J_A | J_START | J_SELECT))
        {
            return true;
        }
        
        frame_counter++;
        wait_vbl_done();
    }
    return false;
}

// inline void finish_frame_with_animation(uint8_t count){
//     if (finish_frame_with_animation_inner(count))
//     {
//         return;
//     }
// }

bool finish_frame_with_animation_inner(uint8_t count){
    uint8_t iterator;
    unsigned char joy = 0x00;
    for ( iterator = 0; iterator < count; iterator++)
    {
        joy = joypad();
        if (joy & (J_A | J_START | J_SELECT))
        {
            return true;
        }

        frame_counter++;
        render_player();
        end_frame();
        wait_vbl_done();
    }
    return false;
}

void screen_shake(uint8_t frames, const metasprite_t* player_frame){
    uint8_t iterator;
    for (iterator = 0; iterator < frames; iterator++)
    {
        uint8_t movement_x = (frame_counter) & 0x01 ? 8 : (frame_counter >> 1) & 0x01 ? 5 : 11;
        move_bkg(movement_x, 0);
        move_metasprite(player_frame, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x) + movement_x - 8, player_y);
        frame_counter++;
        wait_vbl_done();
    }
    move_bkg(8, 0);
    move_metasprite(player_frame, TILE_NUM_START, SPR_NUM_START, (uint8_t)SUB_TO_PX(player_x), player_y);
}

void pan_up(uint8_t dy){
    current_camera_y-=dy;
    move_bkg(8, current_camera_y);

    if (is_generated){return;}
    
    uint8_t current_floor = (((current_camera_y-1) >> 3) & 0x1F) >> 3;
    uint8_t old_floor = (((prev_camera_y) >> 3) & 0x1F) >> 3;
    if(current_floor != old_floor){
        //gen new floor
        if(!is_generated){
        set_bkg_tiles(1, current_floor << 3, 20, 8, floor_map);
        if(current_floor == 0) {is_generated = true;}
    }
        prev_camera_y = current_camera_y-1;
    }

    //move sprites down
    for (uint8_t j = 0; j < 4; j++)
    {
        if(shadow_OAM[j].y < 160){shadow_OAM[j].y += dy;}
        if(shadow_OAM[16 + j].y < 160){shadow_OAM[16 + j].y += dy;}
    }
}

void pan_cloud(void){
    set_win_based_tiles(0, 0, 32, 1, cloud_map, 0);
    SHOW_WIN;
    max_scan = 3;
    cloud_cut_scan = 0;

    remove_VBL(VBL_interrupt);
    remove_LCD(LCD_interrupt);

    CRITICAL {
        add_VBL(VBL_interrupt);
        add_LCD(LCD_interrupt);
        set_interrupts(VBL_IFLAG | LCD_IFLAG);
        STAT_REG |= 0x40; // enable LY == LYC mode 
        //LYC_REG = 160u;   // make it never fire
    }

    move_win(7, 0);
    for (i = 0; i < 24; i++)
    {
        cloud_cut_scan+=6;
        max_scan+=6;
        move_win(7, cloud_cut_scan);
        pan_up(16);
        finish_frame(1)
    }
    remove_VBL(VBL_interrupt);
    remove_LCD(LCD_interrupt);

    finish_frame(15)
    BGP_REG = DMG_PALETTE(DMG_WHITE, DMG_LITE_GRAY, DMG_DARK_GRAY, DMG_BLACK);
    move_win(7,0);
    SHOW_WIN;
    cloud_cut_scan = 6;
    for (i = 0; i < 24; i++)
    {
        move_win(7, cloud_cut_scan);
        cloud_cut_scan+=6;
        pan_up(16);
        finish_frame(1)
    }
    HIDE_WIN;
}