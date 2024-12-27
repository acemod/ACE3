#define COMPONENT cookoff
#define COMPONENT_BEAUTIFIED Cook off
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_COOKOFF
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COOKOFF
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COOKOFF
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// Stages of cookoff in order (in seconds)
// Should be no un-synced randomness in these as the effects must be run on each client
#define SMOKE_DELAY 10.5
#define DETONATION_DELAY 3
#define COOKOFF_TIME 14 // Cook off time should be 20s at most due to length of sound files
#define ENGINE_FIRE_TIME 240
#define MIN_TIME_BETWEEN_FLAMES 5
#define MAX_TIME_BETWEEN_FLAMES 15
#define MAX_TIME_BETWEEN_AMMO_DET 25
#define MAX_COOKOFF_INTENSITY 10

#define MIN_AMMO_DETONATION_START_DELAY 1 // Min time to wait before a vehicle's ammo starts to cookoff
#define MAX_AMMO_DETONATION_START_DELAY 6 // Max time to wait before a vehicle's ammo starts to cookoff

// Common commander hatch defines for default vehicles
#define DEFAULT_COMMANDER_HATCHES ["osa_poklop_commander", "hatch_commander_axis"]

#define DISTANCE_CLOSE 235
#define DISTANCE_MID 952
