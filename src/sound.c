#include "sound.h"
#include <gb/gb.h>

void sound_init(void);
void stop_sfx(void);

void play_jump_sfx(void);
void stop_jump_sfx(void);

void play_bump_sfx(void);
void play_break_sfx(void);

void play_hurt_sfx(void);
void stop_hurt_sfx(void);

void play_boing_sfx(void);

//void play_step_sfx(void);

void sound_init(void){
    NR52_REG = 0x80;
    NR50_REG = 0x77;
    NR51_REG = 0xFF;
}
void stop_sfx(void){
    NR51_REG = 0xEE;
}

void play_jump_sfx(void){
    NR10_REG = 0x37;
    NR11_REG = 0xC2;
    NR12_REG = 0xB2;
    NR13_REG = 0x68;
    NR14_REG = 0x86;
}

void stop_jump_sfx(void){
    NR12_REG = 0xB1;
}

void play_bump_sfx(void){
    NR10_REG = 0x1A;
    NR11_REG = 0x82;
    NR12_REG = 0x81;
    NR13_REG = 0x68;
    NR14_REG = 0x86;
}

void play_break_sfx(void){
    NR41_REG = 0x19;
    NR42_REG = 0xA1;
    NR43_REG = 0x7B;
    NR44_REG = 0x80;
}

void play_hurt_sfx(void){
    NR10_REG = 0x1F;
    NR11_REG = 0x02;
    NR12_REG = 0xF9;
    NR13_REG = 0x4A;
    NR14_REG = 0x86;
}

void stop_hurt_sfx(void){
    NR12_REG = 0x01;
}

void play_boing_sfx(void){
    NR10_REG = 0x37;
    NR11_REG = 0xC2;
    NR12_REG = 0xB2;
    NR13_REG = 0x00;
    NR14_REG = 0x84;
}
/*
void play_step_sfx(void){
    NR10_REG = 0x10;
    NR11_REG = 0x02;
    NR12_REG = 0xC8;
    NR13_REG = 0xFF;
    NR14_REG = 0x84;
}
*/