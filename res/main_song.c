#include "hUGEDriver.h"
#include <stddef.h>

static const unsigned char order_cnt = 10;

static const unsigned char P0[] = {
    DN(C_5,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_4,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,8,0x000),
    DN(Ds5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_5,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,8,0x000),
    DN(As5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,1,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P1[] = {
    DN(G_4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs4,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(C_5,8,0x000),
    DN(B_4,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_5,8,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,1,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P2[] = {
    DN(B_3,6,0x000),
    DN(Ds4,6,0x000),
    DN(Fs4,6,0x000),
    DN(B_4,6,0x000),
    DN(B_3,7,0x000),
    DN(Fs4,8,0x000),
    DN(B_4,9,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P3[] = {
    DN(Cs4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Cs4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Cs4,8,0x000),
    DN(Cs4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Cs4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Cs4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Cs4,8,0x000),
    DN(Cs4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(D_5,13,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P4[] = {
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_5,6,0x000),
    DN(A_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds5,6,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_5,6,0x000),
    DN(B_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,6,0x000),
    DN(C_6,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,6,0x000),
    DN(A_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(C_6,6,0x000),
    DN(B_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,6,0x000),
    DN(A_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds5,6,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_6,5,0x000),
    DN(G_6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs6,5,0x000),
    DN(Ds6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs6,5,0x000),
};
static const unsigned char P5[] = {
    DN(B_4,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,9,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs6,9,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs6,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,9,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P6[] = {
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(E_5,2,0x000),
    DN(B_5,2,0x000),
    DN(E_6,2,0x000),
    DN(___,0,0x000),
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(G_5,2,0x000),
    DN(B_5,2,0x000),
    DN(Ds6,2,0x000),
    DN(___,0,0x000),
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(E_5,2,0x000),
    DN(G_5,2,0x000),
    DN(B_5,2,0x000),
    DN(___,0,0x000),
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(B_4,2,0x000),
    DN(E_5,2,0x000),
    DN(G_5,2,0x000),
    DN(___,0,0x000),
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(B_4,2,0x000),
    DN(G_5,2,0x000),
    DN(B_5,2,0x000),
    DN(___,0,0x000),
    DN(B_3,2,0x000),
    DN(___,0,0x000),
    DN(B_3,9,0x000),
    DN(___,0,0x000),
    DN(Ds4,2,0x000),
    DN(B_4,2,0x000),
    DN(Fs5,2,0x000),
    DN(B_5,2,0x000),
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(G_4,2,0x000),
    DN(___,0,0x000),
    DN(G_4,9,0x000),
    DN(G_4,2,0x000),
    DN(Fs4,2,0x000),
    DN(Fs4,9,0x000),
    DN(___,0,0x000),
    DN(Fs4,2,0x000),
    DN(Ds4,2,0x000),
    DN(Ds4,9,0x000),
    DN(___,0,0x000),
    DN(Ds4,2,0x000),
};
static const unsigned char P7[] = {
    DN(D_4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
    DN(F_6,11,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(F_6,11,0x000),
    DN(D_4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(F_6,11,0x000),
    DN(D_4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(F_6,11,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
    DN(D_4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
    DN(F_6,11,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(F_6,11,0x000),
    DN(D_4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(F_6,11,0x000),
    DN(D_4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(F_6,11,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,3,0x000),
};
static const unsigned char P8[] = {
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_5,6,0x000),
    DN(A_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds5,6,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_5,6,0x000),
    DN(B_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,6,0x000),
    DN(C_6,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,6,0x000),
    DN(A_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(C_6,6,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(D_5,6,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,6,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(D_5,6,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,6,0x000),
    DN(B_4,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,5,0x000),
    DN(Cs6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Cs6,5,0x000),
    DN(Ds6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,5,0x000),
};
static const unsigned char P9[] = {
    DN(B_4,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,9,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(As5,9,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(As5,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,9,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,2,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P10[] = {
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(E_5,2,0x000),
    DN(B_5,2,0x000),
    DN(E_6,2,0x000),
    DN(___,0,0x000),
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(G_5,2,0x000),
    DN(B_5,2,0x000),
    DN(Ds6,2,0x000),
    DN(___,0,0x000),
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(E_5,2,0x000),
    DN(G_5,2,0x000),
    DN(B_5,2,0x000),
    DN(___,0,0x000),
    DN(E_4,2,0x000),
    DN(___,0,0x000),
    DN(E_4,9,0x000),
    DN(___,0,0x000),
    DN(B_4,2,0x000),
    DN(E_5,2,0x000),
    DN(G_5,2,0x000),
    DN(___,0,0x000),
    DN(B_4,2,0x000),
    DN(___,0,0x000),
    DN(B_4,9,0x000),
    DN(___,0,0x000),
    DN(D_5,2,0x000),
    DN(Fs5,2,0x000),
    DN(B_5,2,0x000),
    DN(___,0,0x000),
    DN(Fs4,2,0x000),
    DN(___,0,0x000),
    DN(Fs4,9,0x000),
    DN(___,0,0x000),
    DN(As4,2,0x000),
    DN(Cs5,2,0x000),
    DN(Fs5,2,0x000),
    DN(As5,2,0x000),
    DN(B_4,2,0x000),
    DN(___,0,0x000),
    DN(B_4,9,0x000),
    DN(___,0,0x000),
    DN(B_4,2,0x000),
    DN(___,0,0x000),
    DN(B_4,9,0x000),
    DN(B_4,2,0x000),
    DN(Cs5,2,0x000),
    DN(Cs5,9,0x000),
    DN(___,0,0x000),
    DN(Cs5,2,0x000),
    DN(D_5,2,0x000),
    DN(D_5,9,0x000),
    DN(___,0,0x000),
    DN(D_5,2,0x000),
};
static const unsigned char P12[] = {
    DN(A_5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Gs5,5,0x000),
    DN(A_5,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(As5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,1,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs6,5,0x000),
    DN(G_6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds6,5,0x000),
    DN(E_6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_5,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_5,1,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs6,5,0x000),
};
static const unsigned char P13[] = {
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(Ds5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_4,6,0x000),
    DN(Ds5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_4,6,0x000),
    DN(Ds5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_4,6,0x000),
    DN(Ds5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_4,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds5,6,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds5,6,0x000),
    DN(Fs5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds5,6,0x000),
};
static const unsigned char P14[] = {
    DN(A_4,2,0x000),
    DN(___,0,0x000),
    DN(A_4,9,0x000),
    DN(___,0,0x000),
    DN(C_5,2,0x000),
    DN(E_5,2,0x000),
    DN(A_5,2,0x000),
    DN(___,0,0x000),
    DN(A_4,2,0x000),
    DN(___,0,0x000),
    DN(A_4,9,0x000),
    DN(___,0,0x000),
    DN(C_5,2,0x000),
    DN(E_5,2,0x000),
    DN(A_5,2,0x000),
    DN(___,0,0x000),
    DN(B_4,2,0x000),
    DN(___,0,0x000),
    DN(B_4,9,0x000),
    DN(___,0,0x000),
    DN(Ds5,2,0x000),
    DN(Fs5,2,0x000),
    DN(B_5,2,0x000),
    DN(___,0,0x000),
    DN(B_4,2,0x000),
    DN(___,0,0x000),
    DN(B_4,9,0x000),
    DN(___,0,0x000),
    DN(Ds5,2,0x000),
    DN(Fs5,2,0x000),
    DN(B_5,2,0x000),
    DN(___,0,0x000),
    DN(E_5,2,0x000),
    DN(___,0,0x000),
    DN(E_5,9,0x000),
    DN(___,0,0x000),
    DN(G_5,2,0x000),
    DN(B_5,2,0x000),
    DN(E_6,2,0x000),
    DN(___,0,0x000),
    DN(E_5,2,0x000),
    DN(___,0,0x000),
    DN(E_5,9,0x000),
    DN(___,0,0x000),
    DN(G_5,2,0x000),
    DN(B_5,2,0x000),
    DN(E_6,2,0x000),
    DN(___,0,0x000),
    DN(Ds5,2,0x000),
    DN(___,0,0x000),
    DN(Ds5,9,0x000),
    DN(___,0,0x000),
    DN(G_5,2,0x000),
    DN(B_5,2,0x000),
    DN(G_5,2,0x000),
    DN(B_4,2,0x000),
    DN(B_4,2,0x000),
    DN(___,0,0x000),
    DN(B_4,9,0x000),
    DN(B_4,2,0x000),
    DN(As4,2,0x000),
    DN(___,0,0x000),
    DN(As4,9,0x000),
    DN(As4,2,0x000),
};
static const unsigned char P16[] = {
    DN(G_6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs6,5,0x000),
    DN(G_6,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_6,5,0x000),
    DN(G_6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_6,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Gs6,5,0x000),
    DN(A_6,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_6,5,0x000),
    DN(G_6,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_6,5,0x000),
    DN(C_5,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_4,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,8,0x000),
    DN(Ds5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_5,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,8,0x000),
    DN(As5,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_5,6,0x000),
    DN(G_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs5,6,0xB02),
};
static const unsigned char P17[] = {
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(A_4,6,0x000),
    DN(G_4,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Fs4,5,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(C_5,8,0x000),
    DN(B_4,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(E_5,8,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(Ds5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(G_5,8,0x000),
    DN(E_5,6,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(B_5,1,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};
static const unsigned char P18[] = {
    DN(A_4,2,0x000),
    DN(___,0,0x000),
    DN(A_4,9,0x000),
    DN(___,0,0x000),
    DN(C_5,2,0x000),
    DN(E_5,2,0x000),
    DN(A_5,2,0x000),
    DN(___,0,0x000),
    DN(A_4,2,0x000),
    DN(___,0,0x000),
    DN(A_4,9,0x000),
    DN(___,0,0x000),
    DN(C_5,2,0x000),
    DN(E_5,2,0x000),
    DN(A_5,2,0x000),
    DN(___,0,0x000),
    DN(A_4,2,0x000),
    DN(___,0,0x000),
    DN(A_4,9,0x000),
    DN(___,0,0x000),
    DN(C_5,2,0x000),
    DN(E_5,2,0x000),
    DN(A_5,2,0x000),
    DN(___,0,0x000),
    DN(A_4,2,0x000),
    DN(___,0,0x000),
    DN(A_4,9,0x000),
    DN(___,0,0x000),
    DN(As4,2,0x000),
    DN(___,0,0x000),
    DN(As4,9,0x000),
    DN(___,0,0x000),
    DN(B_4,6,0x000),
    DN(Ds5,6,0x000),
    DN(Fs5,6,0x000),
    DN(B_5,6,0x000),
    DN(B_4,7,0x000),
    DN(Fs5,8,0x000),
    DN(B_5,9,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
};

static const unsigned char itNoiseSP1[] = {
    DN(___,0,0x000),
    DN(68,0,0x000),
    DN(68,0,0x000),
    DN(68,4,0x000),
    DN(68,0,0x000),
    DN(68,0,0x000),
    DN(68,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP2[] = {
    DN(___,0,0x000),
    DN(67,0,0x000),
    DN(67,0,0x000),
    DN(67,4,0x000),
    DN(67,0,0x000),
    DN(67,0,0x000),
    DN(67,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP3[] = {
    DN(___,0,0x000),
    DN(64,0,0x000),
    DN(64,0,0x000),
    DN(64,4,0x000),
    DN(64,0,0x000),
    DN(64,0,0x000),
    DN(64,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP4[] = {
    DN(___,0,0x000),
    DN(68,0,0x000),
    DN(68,0,0x000),
    DN(68,4,0x000),
    DN(68,0,0x000),
    DN(68,0,0x000),
    DN(68,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP5[] = {
    DN(___,0,0x000),
    DN(60,0,0x000),
    DN(60,0,0x000),
    DN(60,4,0x000),
    DN(60,0,0x000),
    DN(60,0,0x000),
    DN(60,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP6[] = {
    DN(___,0,0x000),
    DN(52,0,0x000),
    DN(52,0,0x000),
    DN(52,4,0x000),
    DN(52,0,0x000),
    DN(52,0,0x000),
    DN(52,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP7[] = {
    DN(___,0,0x000),
    DN(60,0,0x000),
    DN(60,0,0x000),
    DN(60,4,0x000),
    DN(60,0,0x000),
    DN(60,0,0x000),
    DN(60,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP8[] = {
    DN(___,0,0x000),
    DN(60,0,0x000),
    DN(60,0,0x000),
    DN(60,4,0x000),
    DN(60,0,0x000),
    DN(60,0,0x000),
    DN(60,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP9[] = {
    DN(___,0,0x000),
    DN(52,0,0x000),
    DN(51,0,0x000),
    DN(51,4,0x000),
    DN(51,0,0x000),
    DN(51,0,0x000),
    DN(51,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP10[] = {
    DN(___,0,0x000),
    DN(68,0,0x000),
    DN(68,0,0x000),
    DN(68,4,0x000),
    DN(68,0,0x000),
    DN(68,0,0x000),
    DN(68,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP11[] = {
    DN(___,0,0x000),
    DN(52,0,0x000),
    DN(51,0,0x000),
    DN(51,4,0x000),
    DN(51,0,0x000),
    DN(51,0,0x000),
    DN(51,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP12[] = {
    DN(___,0,0x000),
    DN(63,0,0x000),
    DN(50,0,0x000),
    DN(53,4,0x000),
    DN(34,0,0x000),
    DN(36,0,0x000),
    DN(36,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char itNoiseSP13[] = {
    DN(___,0,0x000),
    DN(49,0,0x000),
    DN(47,0,0x000),
    DN(45,4,0x000),
    DN(43,0,0x000),
    DN(43,0,0x000),
    DN(43,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,0,0x000),
    DN(___,1,0x000),
};
static const unsigned char* const order1[] = {P0,P4,P8,P12,P16};
static const unsigned char* const order2[] = {P1,P5,P9,P13,P17};
static const unsigned char* const order3[] = {P2,P6,P10,P14,P18};
static const unsigned char* const order4[] = {P3,P7,P7,P7,P7};

static const hUGEDutyInstr_t duty_instruments[] = {
    {0,64,245,0,128},
    {0,128,181,0,128},
    {0,0,9,0,192},
    {0,48,184,0,192},
    {0,112,184,0,192},
    {0,176,184,0,192},
    {0,0,184,0,128},
    {0,64,184,0,128},
    {0,128,184,0,128},
};
static const hUGEWaveInstr_t wave_instruments[] = {
    {128,32,1,0,192},
    {128,32,2,0,192},
    {128,32,3,0,192},
    {128,32,4,0,192},
    {128,32,5,0,192},
    {128,32,6,0,192},
    {0,32,7,0,128},
    {0,32,8,0,128},
    {0,32,9,0,128},
};
static const hUGENoiseInstr_t noise_instruments[] = {
    {145,itNoiseSP1,112,0,0},
    {145,itNoiseSP2,96,0,0},
    {145,itNoiseSP3,0,0,0},
    {146,itNoiseSP4,0,0,0},
    {148,itNoiseSP5,0,0,0},
    {148,itNoiseSP6,0,0,0},
    {177,itNoiseSP7,0,0,0},
    {177,itNoiseSP8,128,0,0},
    {177,itNoiseSP9,128,0,0},
    {145,itNoiseSP10,128,0,0},
    {178,itNoiseSP11,0,0,0},
    {177,itNoiseSP12,0,0,0},
    {183,itNoiseSP13,0,0,0},
};

static const unsigned char waves[] = {
    136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,136,
    255,255,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
    255,255,255,255,0,0,0,0,0,0,0,0,0,0,0,0,
    255,255,255,255,255,0,0,0,0,0,0,0,0,0,0,0,
    255,255,255,255,255,255,0,0,0,0,0,0,0,0,0,0,
    255,255,255,255,255,255,255,0,0,0,0,0,0,0,0,0,
    255,255,255,255,255,255,255,255,0,0,0,0,0,0,0,0,
    204,204,204,204,204,204,204,204,51,51,51,51,51,51,51,51,
    170,170,170,170,170,170,170,170,85,85,85,85,85,85,85,85,
    136,136,136,136,136,136,136,136,119,119,119,119,119,119,119,119,
};

const hUGESong_t main_song = {4, &order_cnt, order1, order2, order3,order4, duty_instruments, wave_instruments, noise_instruments, NULL, waves};
