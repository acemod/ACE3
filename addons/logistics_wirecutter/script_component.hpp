#define COMPONENT logistics_wirecutter
#define COMPONENT_BEAUTIFIED Logistics Wire Cutter
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_LOGISTICS_WIRECUTTER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_LOGISTICS_WIRECUTTER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_LOGISTICS_WIRECUTTER
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// find is case sensitive, so keep everything lowercase
#define FENCE_P3DS [\
    "mil_wiredfence_f.p3d",\
    "wall_indfnc_3.p3d",\
    "wall_indfnc_9.p3d",\
    "wall_indfnc_corner.p3d",\
    "pletivo_wired.p3d",\
    "wall_fen1_5.p3d",\
    "net_fence_8m_f.p3d",\
    "razorwire_f.p3d",\
    "wired_fence_4m_f.p3d",\
    "wired_fence_8m_f.p3d",\
    "plasticnetfence_01_short_f.p3d",\
    "plasticnetfence_01_long_f.p3d",\
    "netfence_01_m_4m_f.p3d",\
    "netfence_01_m_8m_f.p3d",\
    "wiredfence_01_4m_f.p3d",\
    "wiredfence_01_8m_f.p3d",\
    "wiredfence_01_16m_f.p3d",\
    "slums01_8m.p3d",\
    "slums02_4m.p3d",\
    "backalley_01_l_1m_f.p3d"\
]

#define SOUND_CLIP_TIME_SPACING 1.5
#define CUT_TIME_DEFAULT 11
#define CUT_TIME_ENGINEER 7.5
