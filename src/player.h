#include <stdbool.h>
#include <stdint.h>

typedef enum _PlayerState {
    PLAYER_STATE_IDLE,
    PLAYER_STATE_RUNNING,
    PLAYER_STATE_JUMPING,
    PLAYER_STATE_FALLING,
    PLAYER_STATE_HURT
} PlayerState;

void player_init(void);
void compute_player_frame(void);

int *debug_info(void);

extern bool player_dead_flag;
extern uint16_t score;
extern bool a_not_pressed;