#define COMPONENT hellfire
#define COMPONENT_BEAUTIFIED Hellfire
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_HELLFIRE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_HELLFIRE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_HELLFIRE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define STAGE_LAUNCH 1
#define STAGE_SEEK_CRUISE 2
#define STAGE_ATTACK_CRUISE 3
#define STAGE_ATTACK_TERMINAL 4

#define IDC_MODECONTROLGROUP 1000
#define IDC_ATTACKMODE 1001
#define IDC_LASERCODE 1002
#define IDC_LASERICON 1003
