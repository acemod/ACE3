#define COMPONENT laser_warning
#define COMPONENT_BEAUTIFIED Laser Warning System
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_LASER_WARNING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_LASER_WARNING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_LASER_WARNING
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define PROCESS_DELAY (1 / 10)

#define SOUND_BEARINGS_0 [QGVAR(direction_num_0), QGVAR(direction_num_1), QGVAR(direction_num_2), QGVAR(direction_num_3), QGVAR(direction_num_4), QGVAR(direction_num_5), QGVAR(direction_num_6), QGVAR(direction_num_7), QGVAR(direction_num_8), QGVAR(direction_num_9), QGVAR(direction_num_10), QGVAR(direction_num_11), QGVAR(direction_num_12)]
#define SOUND_HEADINGS_0 [QGVAR(direction_north), QGVAR(direction_east), QGVAR(direction_south), QGVAR(direction_west)]
#define SOUND_OCLOCK_0   [QGVAR(direction_oclock), QGVAR(direction_num_1), QGVAR(direction_num_2), QGVAR(direction_num_3), QGVAR(direction_num_4), QGVAR(direction_num_5), QGVAR(direction_num_6), QGVAR(direction_num_7), QGVAR(direction_num_8), QGVAR(direction_num_9), QGVAR(direction_num_10), QGVAR(direction_num_11), QGVAR(direction_num_12)]
#define SOUND_RELATIVE_0 [QGVAR(direction_front), QGVAR(direction_right), QGVAR(direction_back), QGVAR(direction_left)]

#define AUDIO_SETTING_TEST -1
#define AUDIO_SETTING_PURE 0
#define AUDIO_SETTING_ABSOLUTE 1
#define AUDIO_SETTING_CLOCK 2
#define AUDIO_SETTING_RELATIVE 3
#define AUDIO_SETTING_HEADING 4

#define AUDIO_MAX_QUEUE_LENGTH 5
#define LOG_MINIMUM_TIME_DELTA (1)
#define AI_PING_INTERVAL (5.0)

#define POWER_STATE_OFF 0
#define POWER_STATE_STARTING 1
#define POWER_STATE_ON 2

#define MENU_STATE_MAIN 0