#define COMPONENT rearm
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_REARM
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_REARM
    #define DEBUG_SETTINGS DEBUG_SETTINGS_REARM
#endif

#include "\z\ace\addons\main\script_macros.hpp"


#define REARM_ACTION_DISTANCE 7
#define REARM_TURRET_PATHS [[-1], [0], [0,0], [0,1], [1], [2]]

#define REARM_CALIBERS        [  6,   7,   8,  13, 19, 20, 25, 30, 35, 40, 60, 70, 80, 82, 100, 105, 120, 122, 125, 155, 230, 250]
#define REARM_DURATION_PICKUP [  5,   5,   5,   5,  5,  5,  5,  5,  5,  5,  3,  3,  3,  3,   3,   4,   5,   5,   5,   5,  13,  10]
#define REARM_DURATION_REARM  [ 10,  10,  10,  10, 10, 10, 10, 10, 10, 10,  7,  7,  7,  7,   7,   8,  10,  10,  10,  10,  27,  20]
#define REARM_COUNT           [500, 500, 400, 100, 50, 50, 40, 25, 34, 10,  2,  2,  2,  2,   1,   1,   1,   1,   1,   1,   1,   1]
