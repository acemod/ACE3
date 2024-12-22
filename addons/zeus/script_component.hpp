#define COMPONENT zeus
#define COMPONENT_BEAUTIFIED Zeus
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ZEUS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ZEUS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ZEUS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// UI grid
#define SIZEX ((safeZoneW / safeZoneH) min 1.2)
#define SIZEY (SIZEX / 1.2)
#define W_PART(num) (num * (SIZEX / 40))
#define H_PART(num) (num * (SIZEY / 25))
#define X_PART(num) (W_PART(num) + (safeZoneX + (safeZoneW - SIZEX) / 2))
#define Y_PART(num) (H_PART(num) + (safeZoneY + (safeZoneH - SIZEY) / 2))

#define CAN_CREATE_NONE    -1
#define CAN_CREATE_ADMIN    0
#define CAN_CREATE_CONSOLE  1
#define CAN_CREATE_ALL      2

#define MINE_REVEAL_NONE 0
#define MINE_REVEAL_TO_SIDE 1
#define MINE_REVEAL_FULL 2
