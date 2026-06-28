#define COMPONENT quickmount
#define COMPONENT_BEAUTIFIED Quick Mount
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_QUICKMOUNT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_QUICKMOUNT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_QUICKMOUNT
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define DEFAULT_DISTANCE 3
#define DEFAULT_SPEED 18
#define DEFAULT_PRIORITY 0

#define ICON_DRIVER    "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa"
#define ICON_PILOT     "A3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa"
#define ICON_CARGO     "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa"
#define ICON_GUNNER    "A3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa"
#define ICON_COMMANDER "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa"
#define ICON_TURRET    "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa"
#define ICON_FFV       "A3\ui_f\data\IGUI\Cfg\CrewAimIndicator\gunnerAuto_ca.paa"
