#define COMPONENT rangecard
#define COMPONENT_BEAUTIFIED Range Card
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_RANGECARD
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_RANGECARD
    #define DEBUG_SETTINGS DEBUG_SETTINGS_RANGECARD
#endif

#define STD_AIR_DENSITY_ICAO 1.22498

#define RANGE_CARD_INCREMENT    50
#define RANGE_CARD_START_RANGE  100
#define RANGE_CARD_END_RANGE    (RANGE_CARD_START_RANGE + 49 * RANGE_CARD_INCREMENT)

#define IDC_CAPTION_TEXT_1                      770000
#define IDC_CAPTION_TEXT_2                      770001
#define IDC_CAPTION_TEXT_3                      770002
#define IDC_ZERO_RANGE_TEXT                     770003
#define IDC_BAROMETRIC_PRESSURE_TEXT            770004
#define IDC_TARGET_RANGE_TEXT_1                 770010
#define IDC_TARGET_RANGE_TEXT_2                 770011
#define IDC_TARGET_RANGE_TEXT_3                 770012
#define IDC_BULLET_DROP_TEXT_1                  770013
#define IDC_WIND_LEAD_CAPTION_LIST              770100
#define IDC_WIND_LEAD_CAPTION_LIST_LEFT         770101
#define IDC_WIND_LEAD_CAPTION_LIST_RIGHT        770102
#define IDC_TEMPERATURE_CAPTION_LIST_1          770200
#define IDC_TEMPERATURE_CAPTION_LIST_1_LEFT     770201
#define IDC_TEMPERATURE_CAPTION_LIST_1_RIGHT    770202
#define IDC_TEMPERATURE_CAPTION_LIST_2          770300
#define IDC_TEMPERATURE_CAPTION_LIST_2_LEFT     770301
#define IDC_TEMPERATURE_CAPTION_LIST_2_RIGHT    770302
#define IDC_RANGE_CARD_DATA                     770400
#define IDC_RANGE_CARD_DATA_LEFT                770401
#define IDC_RANGE_CARD_DATA_RIGHT               770402
#define IDC_FOOTNOTE_TEXT_1                     770020
#define IDC_FOOTNOTE_TEXT_2                     770021

#include "\z\ace\addons\main\script_macros.hpp"
