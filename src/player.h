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
void render_player(void);
void end_frame(void);

int *debug_info(void);

extern uint16_t player_x;
extern uint8_t player_y;
extern PlayerState current_state;
extern bool is_facing_right;

extern bool player_dead_flag;
extern uint16_t score;
extern bool a_not_pressed;