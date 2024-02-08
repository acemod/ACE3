#define COMPONENT frag
#define COMPONENT_BEAUTIFIED Frag
#include "\z\ace\addons\main\script_mod.hpp"

// #define LOG_FRAG_INFO
#define DEBUG_MODE_FULL
// #define DEBUG_MODE_DRAW
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FRAG
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FRAG
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FRAG
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// Mimimum hold-off time between frag events globally or per vehicle
#define ACE_FRAG_HOLDOFF 0.25
#define ACE_FRAG_HOLDOFF_VEHICLE 1
// Scaling for the min/max # of fragments since last frag event
#define ACE_FRAG_COUNT_MIN_TIME 0.1
#define ACE_FRAG_COUNT_MIN 5
#define ACE_FRAG_COUNT_MAX_TIME 1
#define ACE_FRAG_COUNT_MAX 50
// Default hitpoint targets
#define ACE_FRAG_HITPOINTS ["spine1", "spine1", "spine1", "spine2", "spine2", "spine2", "spine3", "spine3", "spine3", "pelvis", "pelvis", "pelvis", "head", "leftarm", "leftarmroll", "leftforearm", "rightarm", "rightarmroll", "rightforearm", "leftupleg", "leftuplegroll", "leftlegroll", "leftfoot", "rightupleg", "rightuplegroll", "rightleg", "rightlegroll", "rightfoot", "neck"]
// half of gravity approx 9.81/2
#define ACE_FRAG_HALF_GRAVITY_APPROX 4.905
// Lowest chance to hit of 0.5%
#define ACE_FRAG_MIN_FRAG_HIT_CHANCE 0.005
#define ACE_FRAG_MIN_GROUND_OFFSET 0.25
// Make frag hold-off time shortger for low frag
// value of 150/4/pi ~= 11.93662
#define ACE_FRAG_LOW_FRAG_MOD_COUNT 11.93662
#define ACE_FRAG_LOW_FRAG_COEFF 4
#define ACE_FRAG_LOW_FRAG_HOLDOFF_REDUCTION 4
// Max frag distance - correlates to a a fragCount of 20k & hit chance of 0.5%
#define ACE_FRAG_MAX_FRAG_RANGE 565

// Spall values
#define ACE_FRAG_SPALL_HOLDOFF 0.25
#define ACE_FRAG_SPALL_VELOCITY_INHERIT_COEFF 0.5
// sqrt(2)/50
#define ACE_FRAG_ROUND_COEF 0.02828427