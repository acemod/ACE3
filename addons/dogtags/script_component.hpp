#define COMPONENT dogtags
#define COMPONENT_BEAUTIFIED Dogtags
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_DOGTAGS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_DOGTAGS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_DOGTAGS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#define DOGTAG_SHOW_DELAY 1

#define RUSTLING_SOUNDS [\
    "a3\sounds_f\characters\ingame\AinvPknlMstpSlayWpstDnon_medic.wss",\
    "a3\sounds_f\characters\ingame\AinvPknlMstpSlayWrflDnon_medic.wss",\
    "a3\sounds_f\characters\ingame\AinvPpneMstpSlayWpstDnon_medic.wss",\
    "a3\sounds_f\characters\ingame\AinvPpneMstpSlayWrflDnon_medic.wss"\
]
