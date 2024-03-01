#include <stdint.h>
#include <stdbool.h>
enum RECT_TYPE {
    SOLID,
    TRAVERSABLE,
    INACTIVE,
    BOUNCY,
    SHINGLED,
    SPIKEY,
    INIT_FLAG
};

typedef struct Rectangle {
    uint8_t x;
    uint8_t y;
    uint8_t size_x;
    uint8_t size_y;
    enum RECT_TYPE type;
} rect;

typedef struct Window_status {
    uint8_t components; //Four upper bits top_component     -   Four lower bits bot_component
    uint8_t status; //Four upper bits top_component     -   Four lower bits bot_component
} window_status;

extern window_status map_components[4][4]; //four floors, same convention as window_components_on_current_floor (32 BYTES)

typedef struct Window_component_struct{
    uint8_t y_offset;
    uint8_t h;
    unsigned char* map;
    rect collider;
} window_component_struct;

extern rect rect_list[4][8]; //[F][0x0000 0WWX] F=floor WW=Window X= (top = 1 / bot = 0)
extern uint8_t camera_y;
extern bool game_started_flag;
extern bool game_ended_flag;
extern uint8_t r;
extern bool rand_init;

extern uint8_t clothes_position[4];
extern uint8_t clothes_speed;
extern uint8_t deactivate_weeds_flag;

void load_map(void);
void scene_init(void);
void compute_scene_frame(void);