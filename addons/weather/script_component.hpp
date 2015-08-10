#define COMPONENT weather
#include "\z\ace\addons\main\script_mod.hpp"
//#define DEBUG_ENABLED_WEATHER
#ifdef DEBUG_ENABLED_WEATHER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_WEATHER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_WEATHER
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define ABSOLUTE_ZERO_IN_CELSIUS -273.15
#define KELVIN(t) (t - ABSOLUTE_ZERO_IN_CELSIUS)
#define CELSIUS(t) (t + ABSOLUTE_ZERO_IN_CELSIUS)
#define UNIVERSAL_GAS_CONSTANT 8.314
#define WATER_VAPOR_MOLAR_MASS 0.018016
#define DRY_AIR_MOLAR_MASS 0.028964
#define SPECIFIC_GAS_CONSTANT_DRY_AIR 287.058
#define TO_CELSIUS(t) ((t - 32) / 1.8)
#define TO_FAHRENHEIT(t) (t * 1.8 + 32)
