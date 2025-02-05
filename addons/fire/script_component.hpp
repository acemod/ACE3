#define COMPONENT fire
#define COMPONENT_BEAUTIFIED Fire
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FIRE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FIRE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FIRE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define FIRE_MANAGER_PFH_DELAY 0.25
#define FLARE_SIZE_MODIFIER 5
#define PRONE_ROLLING_ANIMS [\
    "amovppnemstpsnonwnondnon_amovppnemevasnonwnondl",\
    "amovppnemstpsnonwnondnon_amovppnemevasnonwnondr",\
    "amovppnemstpsraswrfldnon_amovppnemevaslowwrfldl",\
    "amovppnemstpsraswrfldnon_amovppnemevaslowwrfldr",\
    "amovppnemstpsraswpstdnon_amovppnemevaslowwpstdl",\
    "amovppnemstpsraswpstdnon_amovppnemevaslowwpstdr",\
    "amovppnemstpsoptwbindnon_amovppnemevasoptwbindl",\
    "amovppnemstpsoptwbindnon_amovppnemevasoptwbindr"\
]

#define BURN_MAX_INTENSITY 10
#define BURN_MIN_INTENSITY 1

#define INTENSITY_DECREASE_MULT_PAT_DOWN 0.8
#define INTENSITY_DECREASE_MULT_ROLLING INTENSITY_DECREASE_MULT_PAT_DOWN

#define INTENSITY_LOSS 0.02
#define INTENSITY_UPDATE 2
#define BURN_PROPAGATE_UPDATE 1
#define BURN_PROPAGATE_DISTANCE 2
#define BURN_THRESHOLD_INTENSE 3

// Ignore UAV/Drone AI Base Classes
#define IGNORE_BASE_UAVPILOTS "B_UAV_AI", "O_UAV_AI", "UAV_AI_base_F"
