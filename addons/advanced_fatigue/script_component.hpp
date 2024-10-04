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

#define UNDERWEAR_WEIGHT 3.5

#define ANTPERCENT 0.8
#define SIM_BODYMASS 70
#define JOULES_PER_ML_O2 20.9
#define VO2MAX_STRENGTH 4.1
#define BIOMECH_EFFICIENCY 0.23
#define REE 18.83 // ((0.5617 * SIM_BODYMASS + 42.57) * BIOMECH_EFFICIENCY)

#define RESPIRATORY_BUFFER 60

#define MUSCLE_TEAR_RATE 0.00004
#define MUSCLE_RECOVERY 0.00000386

#define AE1_ATP_RELEASE_RATE 13.3 // mmol
#define AE2_ATP_RELEASE_RATE 16.7 // mmol
#define AN_ATP_RELEASE_RATE 113.3 // mmol

#define AE1_ATP_RECOVERY 6.60 // mmol
#define AE2_ATP_RECOVERY 5.83 // mmol
#define AN_ATP_RECOVERY 56.70 // mmol

#define AE1_MAXRESERVE 4000000 // mmol
#define AE2_MAXRESERVE   84000 // mmol
#define AN_MAXRESERVE     2300 // mmol

#define MAX_PERFORMANCE_FACTOR 10
