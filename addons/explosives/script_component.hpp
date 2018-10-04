#define COMPONENT explosives
#define COMPONENT_BEAUTIFIED Explosives
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_EXPLOSIVES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_EXPLOSIVES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_EXPLOSIVES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineCommonColors.inc"

#define IDC_TIMER_DIGIT_1 8501
#define IDC_TIMER_DIGIT_2 8502
#define IDC_TIMER_DIGIT_3 8503
#define IDC_TIMER_DIGIT_4 8504
#define IDC_TIMER_SLIDER 8505
#define IDC_TIMER_CONFIRM 8506
#define TIMER_DIGIT_IDCs [IDC_TIMER_DIGIT_1, IDC_TIMER_DIGIT_2, IDC_TIMER_DIGIT_3, IDC_TIMER_DIGIT_4]

#define TIMER_VALUE_MIN 5
#define TIMER_VALUE_MAX 900
#define TIMER_VALUE_DEFAULT 30

#define PLACE_WAITING -1
#define PLACE_CANCEL 0
#define PLACE_APPROVE 1
