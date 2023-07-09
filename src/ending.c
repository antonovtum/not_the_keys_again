#include <gb/gb.h>
#include <stdint.h>
#include <stdlib.h>
#include "ending.h"
#include "player.h"

#include "../res/hud_map.h"

static uint8_t counter;
static bool is_ended;

static uint8_t win_height;

static char score_text[5];

static uint8_t i;

#define MAX_WIN_POSITION_TABLE_SIZE 10
static const uint8_t win_position_table[MAX_WIN_POSITION_TABLE_SIZE] = {
    130, 100, 70, 60, 55, 53, 55, 60, 75, 80
};

void ending_init(void);
static void prepare_ending_frame(void);
void compute_ending_frame(void);

static void scanline_interrupt_script(void){
    uint8_t max_scan = (win_height + 24U) > 144 ? 144 : (win_height + 24U);
    if(LYC_REG == 0x00){
        SHOW_WIN;
        LYC_REG = max_scan;
    }
    else if(LYC_REG == max_scan){
        HIDE_WIN;
        LYC_REG = 0x00;
    }
}

void ending_init(void){
    is_ended = false;
}

void prepare_ending_frame(void){
    //just launch once, if already started then exit
    if(is_ended) return;

    counter = 0;
    is_ended = true;
    win_height = 70;

    set_win_tiles(0,0, 20U, 3U, hud_map);
    itoa(score, score_text, 10);
    for(i=0; score_text[i] != 0 && i < 5; i++){
        score_text[i] += 64U;
    }
    set_win_tiles(8, 1, i, 1, score_text);
    set_win_tile_xy(8 + i, 1, 0x7A);

    move_win(7U, 120U);
    SHOW_WIN;

    CRITICAL {
        STAT_REG = STATF_LYC | STATF_MODE01;
        LYC_REG = 0x00;
        add_LCD(scanline_interrupt_script);
    }
    set_interrupts(VBL_IFLAG | LCD_IFLAG);
}

void compute_ending_frame(void){
    prepare_ending_frame();
    //if(LCDC_REG & 0b00100000) return; //if window already on don't bother
    if(counter == 10u) return; //animation ended 
    
    move_win(7u, win_height);
    win_height = win_height + 1;
    counter++;
    //SHOW_WIN; HIDE_SPRITES;

}
