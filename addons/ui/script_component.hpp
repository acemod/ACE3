#define COMPONENT ui
#define COMPONENT_BEAUTIFIED UI
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_UI
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_UI
    #define DEBUG_SETTINGS DEBUG_SETTINGS_UI
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineResincl.inc"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"

// Basic Elements
#define ELEMENTS_BASIC [QGVAR(soldierVehicleWeaponInfo), QGVAR(vehicleRadar), QGVAR(vehicleCompass), QGVAR(commandMenu), QGVAR(groupBar)]

// Locations
#define ANYWHERE 0
#define GROUND_ONLY 1
#define VEHICLE_ONLY 2

/*
RscUnitInfo = 300
--------------------
118 (Weapon Name / Gunner Weapon Name)
+ 1001 (Weapon Name Background 1/2 / Gunner Weapon Name Background 1/2)
+ 1008 (Weapon Name Background 2/2 / Gunner Weapon Name Background 2/2)

187 (Firing Mode / Gunner Firing Mode)
+ 1203 (Firing Mode Background / Gunner Firing Mode Background)

155 (Ammo Type / Gunner Ammo Type)
184 (Ammo Count / Gunner Ammo Count)
185 (Magazine Count / Gunner Magazine Count)
152 (Grenade/Flare Type / Launchable Type)
151 (Grenade/Flare Count / Launchable Count)
1202 (Lower Weapon Info Background / Gunner Lower Weapon Info Background)
168 (Zeroing / Gunner Zeroing)


120 (Vehicle Name)
1000 (Vehicle Name Background 1/2)
+ 1013 (Vehicle Name Background 2/2)

113 (Vehicle Fuel Bar)
+ 1202 (Vehicle Fuel Bar Background)

121 (Vehicle Speed Number)
+ 1004 (Vehicle Speed Unit)
+ 1006 (Vehicle Speed Background)
122 (Vehicle Altitude Number)
+ 1005 (Vehicle Altitude Units)
+ 1014 (Vehicle Altitude Background)
111 (Vehicle Damage)
1200 (Vehicle Info Background)


RscStanceInfo = 303
--------------------
188 (Stance)
+ 1201 (Stance Background)


RscStaminaBar = 305
--------------------
193 (Stamina Bar)
*/
