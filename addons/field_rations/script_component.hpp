#define COMPONENT field_rations
#define COMPONENT_BEAUTIFIED Field Rations
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_FIELD_RATIONS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_FIELD_RATIONS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_FIELD_RATIONS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#define MP_SYNC_INTERVAL (60 + random 60)

#define REFILL_WATER_INFINITE -10
#define REFILL_WATER_DISABLED -1
#define CHECK_WATER_TIME 2
#define DRINK_FROM_SOURCE_AMOUNT 1
#define DRINK_FROM_SOURCE_QUENCHED 10
#define DRINK_FROM_SOURCE_TIME 10

// Threshold for high hunger/thirst consequences
#define CONSEQ_THRESHOLD_LIGHT 75
#define CONSEQ_THRESHOLD_SEVERE 85

#define IDC_COLORED_HUD_THIRST 6740
#define IDC_COLORED_HUD_HUNGER 6750
#define IDC_DRAINING_HUD_THIRST_GROUP 7740
#define IDC_DRAINING_HUD_THIRST_ICON  7750
#define IDC_DRAINING_HUD_HUNGER_GROUP 7840
#define IDC_DRAINING_HUD_HUNGER_ICON  7850

#define FIELD_RATIONS_ITEMS (uiNamespace getVariable QXGVAR(fieldRationItems))
