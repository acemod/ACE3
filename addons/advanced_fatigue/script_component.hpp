#define COMPONENT advanced_fatigue
#define COMPONENT_BEAUTIFIED Advanced Fatigue
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ADVANCED_FATIGUE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ADVANCED_FATIGUE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ADVANCED_FATIGUE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define ANTPERCENT 0.8
#define SIM_BODYMASS 70
#define JOULES_PER_ML_O2 20.9
#define VO2MAX_STRENGTH 4.1
#define REE 18.83 //((0.5617 * SIM_BODYMASS + 42.57) * 0.23)
#define OXYGEN 0.9
#define WATTSPERATP 7

#define AE1_MAXRESERVE 4000000
#define AE2_MAXRESERVE   84000
#define AN_MAXRESERVE     2300

#define MALE_WEIGHT 87          //kg
#define MALE_HEIGHT 177         //cm
#define MALE_TEMPERATURE 37     //degC
#define BODY_SURFACE_AREA 2.068 //sqrt (MALE_WEIGHT * MALE_HEIGHT / 3600);
#define BASAL_METABOLIC_WATTAGE //Mifflin St Jeor Equation converted to watts (10 * MALE_WEIGHT + 6.25 * MALE_HEIGHT + 5 * 21 + 5) * 0.048;
#define WATER 4.18              //specific heat capacity Joule/gram/degC
#define SKIN 0.5                //skin conductance factor
#define E 2.718                 //natural number
