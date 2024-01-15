#define COMPONENT frag
#define COMPONENT_BEAUTIFIED Frag
#include "\z\ace\addons\main\script_mod.hpp"

// #define LOG_FRAG_INFO
#define DEBUG_MODE_FULL
#define DEBUG_MODE_DRAW
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FRAG
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FRAG
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FRAG
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define ACE_FRAG_HOLDOFF 0.25
#define ACE_FRAG_HOLDOFF_VEHICLE 1
#define ACE_FRAG_SPALL_HOLDOFF 0.25
#define ACE_FRAG_COUNT_MIN 5
#define ACE_FRAG_COUNT_MAX 50
#define ACE_FRAG_HITPOINTS  ["spine1","spine2","spine3","head","leftarm","leftarmroll","leftforearm","rightarm","rightarmroll","rightforearm","pelvis","leftupleg","leftuplegroll","leftlegroll","leftfoot","rightupleg","rightuplegroll","rightleg","rightlegroll","rightfoot"]
#define ACE_FRAG_HITPOINTS_WEIGHTS

#ifndef GLUE
#define GLUE(g1,g2) g1##g2
#endif