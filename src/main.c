#include <gb/gb.h>
#include <gb/metasprites.h>
#include <stdint.h>
#include <stdlib.h>
#include "player.h"
#include "scene.h"
#include "sound.h"
#include "ending.h"
#include "director.h"

uint8_t i; //iterator
static char score_text[5];

#define IS_ANIMATION_STARTED (ending_flags & 0x04)
#define WIN_DIRECTION (ending_flags & 0x02)
#define IS_ANIMATION_FINISHED (ending_flags & 0x01)
#define IS_FORCE_ADDED (ending_flags & 0x08)

void init_gfx(void);
void show_window(void);
void reset_game(void);
void interrupt_lcd(void);
void performant_delay(uint8_t frames);
void fadeout(void);
void fadein(void);

void performant_delay(uint8_t frames){
    uint8_t ii;
    for(ii=0; ii<frames; ii++){
        wait_vbl_done();
    }
}

void main(void)
{
    play_intro_cinematic();

	fadeout();
    init_gfx();
    fadein();
    // Loop forever
    while(1) {


		// Game main loop processing goes here
        compute_player_frame();

		// Done processing, yield CPU and wait for start of next frame
        wait_vbl_done();

        // Prepare next scene render
        compute_scene_frame();

        reset_game();
    }
}

void reset_game(void){
    if(!player_dead_flag) return;
    compute_ending_frame();
    //show_window();
    if(joypad() & J_A && a_not_pressed && IS_ANIMATION_FINISHED){
        fadeout();
        init_gfx();
        fadein();
    }
}

/*
void show_window(void){
    if(LCDC_REG & 0b00100000) return; //if window already on don't bother
    set_win_tiles(0,0, 20U, 3U, hud_map);
    itoa(score, score_text, 10);
    for(i=0; score_text[i] != 0 && i < 5; i++){
        score_text[i] += 64U;
    }
    set_win_tiles(8, 1, i, 1, score_text);
    set_win_tile_xy(8 + i, 1, 0x7A);
    move_win(7U, 120U);

    SHOW_WIN; HIDE_SPRITES;
}
*/

void init_gfx(void) {
    scene_init();

    player_init();

    sound_init();

    ending_init();

	// Turn the background and sprites on to make them visible
    SHOW_BKG; SHOW_SPRITES; HIDE_WIN;
}

void fadeout(void){
    for(i = 0; i < 4; i++){
        switch (i)
        {
        case 0:
            BGP_REG = 0xE4;
            OBP0_REG = 0xE4;
            break;

        case 1:
            BGP_REG = 0xF9;
            OBP0_REG = 0xF9;
            break;

        case 2:
            BGP_REG = 0xFE;
            OBP0_REG = 0xFE;
            break;

        case 3:
            BGP_REG = 0xFF;
            OBP0_REG = 0xFF;
            break;

        default:
            break;
        }
        performant_delay(10U);
    }
}

void fadein(void){
    for(i = 0; i < 3; i++){
        switch (i)
        {
        case 0:
            BGP_REG = 0xFE;
            OBP0_REG = 0xFE;
            break;

        case 1:
            BGP_REG = 0xF9;
            OBP0_REG = 0xF9;
            break;

        case 2:
            BGP_REG = 0xE4;
            OBP0_REG = 0xE4;
            break;
        default:
            break;
        }
        performant_delay(10U);
    }
}
