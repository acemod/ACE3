#define COMPONENT medical_ui
#define COMPONENT_BEAUTIFIED Medical UI
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_UI
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_UI
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_UI
#endif

#include "\z\ace\addons\main\script_macros.hpp"
#include "\z\ace\addons\medical\script_macros_medical.hpp"

#define FX_PAIN_FADE_IN   0.3
#define FX_PAIN_FADE_OUT  0.7
#define FX_UNCON_FADE_IN  2.0
#define FX_UNCON_FADE_OUT 5.0

#define SND_HEARBEAT_FAST   (selectRandom ["ACE_heartbeat_fast_1", "ACE_heartbeat_fast_2", "ACE_heartbeat_fast_3"])
#define SND_HEARBEAT_NORMAL (selectRandom ["ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"])
#define SND_HEARBEAT_SLOW   (selectRandom ["ACE_heartbeat_slow_1", "ACE_heartbeat_slow_2"])
