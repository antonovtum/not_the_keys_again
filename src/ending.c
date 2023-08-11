#include <gb/gb.h>
#include <stdint.h>
#include <stdlib.h>
#include "ending.h"
#include "player.h"

#include "../res/hud_map.h"

uint8_t ending_flags;   //0x0000FPDA
                            //P = is_animation_started (the player just died)
                            //D = direction (0 up, 1 down)
                            //A = is_animation_finished (the player can retry)
                            //F = is_force_added

#define IS_ANIMATION_STARTED (ending_flags & 0x04)
#define WIN_DIRECTION (ending_flags & 0x02)
#define IS_ANIMATION_FINISHED (ending_flags & 0x01)
#define IS_FORCE_ADDED (ending_flags & 0x08)

static uint8_t subpix_speed; //to allow speeds slightly higher than one pixel per frame the speed is counted x4
static uint8_t force;
#define MAX_SPEED 13u
static uint16_t win_height; //8 higher bits is pixel position, 8 lower bits is subpixel position
#define WIN_PIXEL (uint8_t)(win_height >> 8)
static uint8_t max_scan;
#define DESIRED_WIN_HEIGHT 70

static char score_text[5];

static uint8_t i;

void ending_init(void);
static void prepare_ending_frame(void);
void compute_ending_frame(void);

void VBL_isr() { 
    SHOW_WIN;
    LYC_REG = max_scan; 
}
void LCD_isr() {
    if (LY_REG < 144) HIDE_WIN;
}

void ending_init(void){
    ending_flags = 0b10000000;

    //deactivate interrupts
    remove_VBL(VBL_isr);
    remove_LCD(LCD_isr);

    hide_sprite(20);
    hide_sprite(21);
    hide_sprite(22);
    hide_sprite(23);
    hide_sprite(24);
    hide_sprite(25);
}

void prepare_ending_frame(void){
    //just launch once, if already started then exit
    if(IS_ANIMATION_STARTED) {return;}

    ending_flags |= 0x04; //mark is_ended as true
    win_height = 0xB000u;

    force = 4u; //initial force is 4u
    

    set_win_tiles(0,0, 20U, 3U, hud_map);
    itoa(score, score_text, 10);
    for(i=0; score_text[i] != 0 && i < 5; i++){
        score_text[i] += 64U;
    }
    set_win_tiles(8, 1, i, 1, score_text);
    set_win_tile_xy(8 + i, 1, 0x7A);

    //extra banner sprites
    set_sprite_tile(20, 129);
    set_sprite_prop(20, S_FLIPY);
    set_sprite_tile(21, 128);
    set_sprite_prop(21, S_FLIPY);

    //balloons
    set_sprite_tile(22, 35);
    set_sprite_tile(23, 35);
    set_sprite_tile(24, 36);
    set_sprite_tile(25, 36);
    subpix_speed = 252u;

    CRITICAL {
        add_VBL(VBL_isr);
        add_LCD(LCD_isr);
        set_interrupts(VBL_IFLAG | LCD_IFLAG);
        STAT_REG |= 0x40; // enable LY == LYC mode 
        LYC_REG = 160u;   // make it never fire
    }
}

void compute_ending_frame(void){
    prepare_ending_frame();
    move_win(7u, WIN_PIXEL);
    move_sprite(20, 8, WIN_PIXEL + 8u);
    move_sprite(21, 160, WIN_PIXEL + 8u);
    move_sprite(22, 8, WIN_PIXEL - 8);
    move_sprite(23, 160, WIN_PIXEL - 8);
    move_sprite(24, 8, WIN_PIXEL);
    move_sprite(25, 160, WIN_PIXEL);

    //check to change directions of movement and/or force
    if(subpix_speed > MAX_SPEED) {
        ending_flags &= 0b11110111; //IS_FORCE_ADDED = false
        set_sprite_prop(24, S_FLIPX);
        set_sprite_prop(25, S_FLIPX);
    }  
    else if(subpix_speed == 0) {
        //win_height &= 0xFF00;       //clear the subpixel resolution when we arrive at speeds of 0
        ending_flags |= 0b00001001; //IS_FORCE_ADDED = true, IS_ANIMATION_FINISHED = true
        ending_flags ^= 0b00000010; //swap WIN_DIRECTION
        force = 0x00; //make the force smaller for the sway, 0 so it turns to 1 now
        set_sprite_prop(24, 0x00);
        set_sprite_prop(25, 0x00);
    }

    if(IS_ANIMATION_FINISHED){      
        force ^= 0x01; //make the force smaller for the sway, either 1 or 0
    }     
    subpix_speed = (IS_FORCE_ADDED) ? subpix_speed + force : subpix_speed - force;
    win_height = WIN_DIRECTION ? win_height + ((uint16_t)(subpix_speed) << 2) : win_height - ((uint16_t)(subpix_speed) << 2);
    max_scan = WIN_PIXEL + 23U;
}
