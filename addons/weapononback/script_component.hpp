#define COMPONENT weapononback
#define COMPONENT_BEAUTIFIED Weapon on Back
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_WEAPONONBACK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_WEAPONONBACK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_WEAPONONBACK
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// Inventory IDD
#define IDD_INVENTORY 602

// Relevant slot IDCs
#define IDC_PRIMARY_SLOT 610
#define IDC_SECONDARY_SLOT 611

// Custom controls
#define IDC_WEAPON_IMAGE 135001
#define IDC_DROP_CATCHER 135002
#define IDC_DROP_CATCHER_BG 135003

// Container IDCs
#define IDC_GROUND_CONTAINER 632
#define IDC_SOLDIER_CONTAINER 640
#define IDC_UNIFORM_CONTAINER 633
#define IDC_VEST_CONTAINER 638
#define IDC_BACKPACK_CONTAINER 619

// Attachement IDCs
#define IDCS_SECONDARY_ATTACHMENTS [1248, 1266, 1249, 1250, 1251, 624, 642, 626, 625, 627]

// Background IDCs
#define IDC_PRIMARY_BG 1242
#define IDC_SECONDARY_BG 1247

// ID generator for JIP events
#define EVENT_ID(obj) (QGVAR(eventID_) + netId obj)
