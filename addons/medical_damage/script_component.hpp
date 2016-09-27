#define COMPONENT medical_damage
#define COMPONENT_BEAUTIFIED Medical Damage
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define CBA_DEBUG_SYNCHRONOUS
#define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_DAMAGE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_DAMAGE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_DAMAGE
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})
#define GET_STRING(config,default) (if (isText (config)) then {getText (config)} else {default})
#define GET_ARRAY(config,default) (if (isArray (config)) then {getArray (config)} else {default})

#define ALL_BODY_PARTS ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"]
