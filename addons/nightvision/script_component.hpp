#define COMPONENT nightvision
#define COMPONENT_BEAUTIFIED Night Vision
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_NIGHTVISION
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_NIGHTVISION
    #define DEBUG_SETTINGS DEBUG_SETTINGS_NIGHTVISION
#endif

#include "\z\ace\addons\main\script_macros.hpp"


// Effect Settings / Magic values to tweak:
#define st_nvg_AirFogMultiplier 0.5

#define st_nvg_CameraBlurSights_MaxBlur 6

#define st_nvg_MinFog 0.2 
#define st_nvg_MaxFog 0.3

#define st_nvg_Grain_Min 2.25
#define st_nvg_Grain_Max 2.7

#define st_nvg_Blur_Min 0.05
#define st_nvg_Blur_Max 0.11

#define st_nvg_Bright_Min 0.65
#define st_nvg_Bright_Max 0.75

#define st_nvg_Contrast_Min 0.4
#define st_nvg_Contrast_Max 0.8

#define st_nvg_NoiseIntensity_Min 0.4
#define st_nvg_NoiseIntensity_Max 0.55

#define st_nvg_NoiseSharpness_Min 1.2
#define st_nvg_NoiseSharpness_Max 1 
