#define COMPONENT markers
#define COMPONENT_BEAUTIFIED Markers
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MARKERS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_ENABLED_MARKERS
    #define DEBUG_SETTINGS DEBUG_ENABLED_MARKERS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define CHANNEL_NAMES [ \
    localize "str_channel_global", \
    localize "str_channel_side", \
    localize "str_channel_command", \
    localize "str_channel_group", \
    localize "str_channel_vehicle" \
]

#define MOVE_RESTRICTION_NOBODY -1
#define MOVE_RESTRICTION_ALL 0
#define MOVE_RESTRICTION_ADMINS 1
#define MOVE_RESTRICTION_GROUP_LEADERS 2
#define MOVE_RESTRICTION_GROUP_LEADERS_ADMINS 3
