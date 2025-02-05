#include "sound.h"
#include <gb/gb.h>

#include "hUGEDriver.h"

extern const hUGESong_t main_song;

void sound_init(void);
void stop_sfx(void);

void play_main_theme(void);

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

// Calls sound driver to start the main theme
void play_main_theme(void){
    hUGE_init(&main_song);
}

// Calls sound driver to update the music for this frame
void compute_sound_frame(void){
    hUGE_dosound();
}

void play_jump_sfx(void){
    // channel 1 register 0, frequency sweep settings
    // 7    unused
    // 6-4  sweep time(update rate) (if 0, sweeping is off)
    // 3    sweep direction (1: decrease, 0: increase)
    // 2-0  SweepRtShift (if 0, sweeping is off) 
    NR10_REG = 0x37; // 0x 0011 0111
    NR11_REG = 0xC2; // 0x 1100 0010
    NR12_REG = 0xB2; // 0x 1011 0010
    NR13_REG = 0x68; // 0x 0110 1000
    NR14_REG = 0x86; // 0x 1000 0110
}

/*
// see https://github.com/bwhitman/pushpin/blob/master/src/gbsound.txt
// chanel 1 register 0, Frequency sweep settings
// 7Unused
// 6-4Sweep time(update rate) (if 0, sweeping is off)
// 3Sweep Direction (1: decrease, 0: increase)
// 2-0Sweep RtShift amount (if 0, sweeping is off)
// 0001 0110 is 0x16, sweet time 1, sweep direction increase, shift ammount per step 110 (6 decimal)

// chanel 1 register 1: Wave pattern duty and sound length
// Channels 1 2 and 4
// 7-6Wave pattern duty cycle 0-3 (12.5%, 25%, 50%, 75%), duty cycle is how long a quadrangular  wave is "on" vs "of" so 50% (2) is both equal.
// 5-0 sound length (higher the number shorter the sound)
// 01000000 is 0x40, duty cycle 1 (25%), wave length 0 (long)

// chanel 1 register 2: Volume Envelope (Makes the volume get louder or quieter each "tick")
// On Channels 1 2 and 4
// 7-4(Initial) Channel Volume
// 3Volume sweep direction (0: down; 1: up)
// 2-0Length of each step in sweep (if 0, sweeping is off)
// NOTE: each step is n/64 seconds long, where n is 1-7
// 0111 0011 is 0x73, volume 7, sweep down, step length 3

// chanel 1 register 3: Frequency LSbs (Least Significant bits) and noise options
// for Channels 1 2 and 3
// 7-08 Least Significant bits of frequency (3 Most Significant Bits are set in register 4)

// chanel 1 register 4: Playback and frequency MSbs
// Channels 1 2 3 and 4
// 7Initialize (trigger channel start, AKA channel INIT) (Write only)
// 6Consecutive select/length counter enable (Read/Write). When "0", regardless of the length of data on the NR11 register, sound can be produced consecutively.  When "1", sound is generated during the time period set by the length data contained in register NR11.  After the sound is ouput, the Sound 1 ON flag, at bit 0 of register NR52 is reset.
// 5-3Unused
// 2-03 Most Significant bits of frequency
// 1100 0011 is 0xC3, initialize, no consecutive, frequency = MSB + LSB = 011 0000 0000 = 0x300
*/

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