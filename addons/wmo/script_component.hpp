#define COMPONENT wmo
#define COMPONENT_BEAUTIFIED WMO
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_WMO
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_WMO
    #define DEBUG_SETTINGS DEBUG_SETTINGS_WMO
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// All of the following are empirically tuned by the original author. There is no
// derivation on record, so treat them as feel values rather than physics.

// Downward probe for a surface to stand on, relative to the unit's feet.
#define SEARCH_HEIGHT 0.6
#define SEARCH_DEPTH -5

// The helper roadway is floated slightly above the hit point, scaled by how fast the
// anchor is moving into the unit, so fast vehicles do not punch through it.
#define HELPER_OFFSET_BASE 0.1
#define HELPER_OFFSET_SCALE 0.1

// Forward collision probes. Three rays fanned around the movement vector catch walls
// and superstructure the unit is about to be pushed into.
#define COLLISION_PROBE_ANGLE 30
#define COLLISION_DISTANCE 0.5
// Surfaces flatter than this are floor, not something to be stopped by.
#define COLLISION_NORMAL_MAX 0.5
// Nudge back along the movement vector when a wall is hit.
#define COLLISION_PUSHBACK -0.02

// Below this gap the unit is snapped down onto the surface, above it they fall.
#define GROUND_SNAP_HEIGHT 0.25
#define GROUND_SNAP_OFFSET -0.1
// Simulated fall acceleration, divided by framerate to stay frame independent.
#define FALL_SPEED 2.8
// Small downward velocity keeps the unit pinned to the surface.
#define ANCHOR_VELOCITY_Z -0.4

// Above this anchor speed setVelocityTransformation stops looking smooth, so snap.
#define SMOOTH_SPEED_LIMIT 12

// How far the unit must get from the anchor before collision is restored.
#define DETACH_DISTANCE 10

// Vaulting animations, during which the feet are not where the probe expects.
#define VAULT_ANIMATIONS ["aovrpercmstpsraswrfldf", "aovrpercmstpsnonwnondf", "aovrpercmstpslowwrfldf"]
