#define COMPONENT medical_damage
#define COMPONENT_BEAUTIFIED Medical Damage
#include "\z\ace\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
#define CBA_DEBUG_SYNCHRONOUS
//#define ENABLE_PERFORMANCE_COUNTERS

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

// scale received pain to 0-2 level to select type of scream
// below 0.25: 0, from 0.25 to 0.5: 1, more than 0.5: 2
#define PAIN_TO_SCREAM(pain) (floor (4 * pain) min 2)
