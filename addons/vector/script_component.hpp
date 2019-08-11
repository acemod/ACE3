#define COMPONENT vector
#define COMPONENT_BEAUTIFIED Vector
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_VECTOR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_VECTOR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_VECTOR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineDIKCodes.inc"

#define IDC_CENTER 1301
#define IDC_CROSSHAIR 1302

#define IDC_DIGIT_0 1310
#define IDC_DIGIT_1 1311
#define IDC_DIGIT_2 1312
#define IDC_DIGIT_3 1313
#define IDC_DIGIT_4 1314
#define IDC_DIGIT_5 1315
#define IDC_DIGIT_6 1316
#define IDC_DIGIT_7 1317
#define IDC_DIGIT_8 1318
#define IDC_DIGIT_9 1319

#define IDC_DIGIT_E1 1321
#define IDC_DIGIT_E2 1322
#define IDC_DIGIT_E3 1323
#define IDC_DIGIT_E4 1324

#define ILLUM_CONTROLS [\
    IDC_CENTER, IDC_CROSSHAIR,\
    IDC_DIGIT_0, IDC_DIGIT_1, IDC_DIGIT_2, IDC_DIGIT_3, IDC_DIGIT_4,\
    IDC_DIGIT_5, IDC_DIGIT_6, IDC_DIGIT_7, IDC_DIGIT_8, IDC_DIGIT_9,\
    IDC_DIGIT_E1, IDC_DIGIT_E2, IDC_DIGIT_E3, IDC_DIGIT_E4\
]
