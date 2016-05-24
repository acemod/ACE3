#define COMPONENT ui
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_UI
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_UI
    #define DEBUG_SETTINGS DEBUG_SETTINGS_UI
#endif

#include "\z\ace\addons\main\script_macros.hpp"


// Basic Elements
#define ELEMENTS_BASIC [QGVAR(soldierVehicleWeaponInfo), QGVAR(vehicleRadar), QGVAR(vehicleCompass), QGVAR(commandMenu), QGVAR(groupBar)]

// Advanced Elements bindings
// IDD, IDCs, Element (must be string to compare to changed setting name), Selective Type (0-both, 1-ground, 2-vehicle)
#define ELEMENTS_ADVANCED [ \
    [300, [118], 1, QGVAR(weaponName)], \
    [300, [1001, 1008], 1, QGVAR(weaponNameBackground)], \
    [300, [187, 1203], 1, QGVAR(firingMode)], \
    [300, [155], 1, QGVAR(ammoType)], \
    [300, [184], 1, QGVAR(ammoCount)], \
    [300, [185], 1, QGVAR(magCount)], \
    [300, [152], 1, QGVAR(throwableName)], \
    [300, [151], 1, QGVAR(throwableCount)], \
    [300, [1202], 1, QGVAR(weaponLowerInfoBackground)], \
    [300, [168], 0, QGVAR(zeroing)], \
    [305, [193], 1, QGVAR(staminaBar)], \
    [303, [188, 1201], 1, QGVAR(stance)], \
    [300, [118], 2, QGVAR(gunnerWeaponName)], \
    [300, [1001, 1008], 2, QGVAR(gunnerWeaponNameBackground)], \
    [300, [187, 1203], 2, QGVAR(gunnerFiringMode)], \
    [300, [155], 2, QGVAR(gunnerAmmoType)], \
    [300, [184], 2, QGVAR(gunnerAmmoCount)], \
    [300, [185], 2, QGVAR(gunnerMagCount)], \
    [300, [1202], 2, QGVAR(gunnerWeaponLowerInfoBackground)], \
    [300, [120], 2, QGVAR(vehicleName)], \
    [300, [1000, 1013], 2, QGVAR(vehicleNameBackground)], \
    [300, [113, 1202], 2, QGVAR(vehicleFuelBar)], \
    [300, [121, 1004, 1006], 2, QGVAR(vehicleSpeed)], \
    [300, [122, 1005, 1014], 2, QGVAR(vehicleAltitude)], \
    [300, [111], 2, QGVAR(vehicleDamage)], \
    [300, [1200], 2, QGVAR(vehicleInfoBackground)] \
]


/*
RscUnitInfo = 300
--------------------
118 (Weapon Name / Gunner Weapon Name)
+ 1001 (Weapon Name Background 1/2)
+ 1008 (Weapon Name Background 2/2)

187 (Firing Mode)
+ 1203 (Firing Mode Background)

155 (Ammo Type / Gunner Ammo Type)
184 (Ammo Count / Gunner Ammo Count) - disabled by default if ace_reload is loaded
185 (Magazine Count)
152 (Grenade/Flare Type)
151 (Grenade/Flare Count)
1202 (Lower Weapon Info Background)
168 (Zeroing)


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
