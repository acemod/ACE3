#define COMPONENT medical_engine
#define COMPONENT_BEAUTIFIED Medical (Engine)
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_ENGINE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_ENGINE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_ENGINE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DISABLE_VANILLA_SCREAMS
#define DISABLE_VANILLA_MOANS
#define DISABLE_VANILLA_HEARTBEAT
#define DISABLE_VANILLA_BLOOD_TEXTURES
#define DISABLE_VANILLA_DAMAGE_EFFECTS

#include "script_macros_medical.hpp"

#define EMPTY_SOUND {"A3\Sounds_F\dummysound.wss",1,1}
#define NAMESPACE_NULL locationNull
