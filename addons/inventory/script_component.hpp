#define COMPONENT inventory
#define COMPONENT_BEAUTIFIED Inventory
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_INVENTORY
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_INVENTORY
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INVENTORY
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define IDC_FILTERLISTS 6554
#define IDC_ITEMLIST_GROUND 632
#define IDC_ITEMLIST_SOLDIER 640
#define IDC_ITEMLIST_UNIFORM 633
#define IDC_ITEMLIST_VEST 638
#define IDC_ITEMLIST_BACKPACK 619

#define DUMMY_VALUE 127
