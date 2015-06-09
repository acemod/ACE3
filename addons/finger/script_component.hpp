#define COMPONENT finger
#include "\z\ace\Addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_FINGER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FINGER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FINGER
#endif

#include "\z\ace\Addons\main\script_macros.hpp"

#define BASE_SIZE 44
#define FP_ICON "\z\ace\addons\finger\img\fp_icon.paa"

#define FP_TIMEOUT 2
#define FP_ACTION_TIMEOUT 1

#define FP_DISTANCE 10000
#define FP_RANDOMIZATION_X 350
#define FP_RANDOMIZATION_Y 100
