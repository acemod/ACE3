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


// Elements
#define ELEMENTS_BASIC [QGVAR(soldierVehicleWeaponInfo), QGVAR(vehicleRadar), QGVAR(vehicleCompass), QGVAR(commandMenu), QGVAR(groupBar)]

// IDD, IDC, Element (must be string to compare to changed setting name)
#define ELEMENTS_ADVANCED [ \
    [300, [118], QGVAR(weaponName)], \
    [300, [1001, 1008], QGVAR(weaponNameBackground)], \
    [300, [187, 1203], QGVAR(firingMode)], \
    [300, [155], QGVAR(ammoType)], \
    [300, [184], QGVAR(ammoCount)], \
    [300, [185], QGVAR(magCount)], \
    [300, [152], QGVAR(throwableName)], \
    [300, [151], QGVAR(throwableCount)], \
    [300, [1202], QGVAR(weaponLowerInfoBackground)], \
    [300, [168], QGVAR(zeroing)], \
    [305, [193], QGVAR(staminaBar)], \
    [303, [188, 1201], QGVAR(stance)], \
    [300, [120], QGVAR(vehicleName)], \
    [300, [1000, 1013], QGVAR(vehicleNameBackground)], \
    [300, [113, 1202], QGVAR(vehicleFuelBar)], \
    [300, [121, 1004, 1006], QGVAR(vehicleSpeed)], \
    [300, [122, 1005, 1014], QGVAR(vehicleAltitude)], \
    [300, [111], QGVAR(vehicleDamage)], \
    [300, [1200], QGVAR(vehicleInfoBackground)], \
    [300, [150], QGVAR(vehicleGunnerWeapon)] \
]


/*
RscUnitInfo = 300
--------------------
118 (Weapon Name)
+ 1001 (Weapon Name Background 1/2)
+ 1008 (Weapon Name Background 2/2)

187 (Firing Mode)
+ 1203 (Firing Mode Background)

155 (Ammo Type)
184 (Ammo Count) - disabled in config by ace_reload
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

150 (Vehicle Gunner Weapon)


RscStanceInfo = 303
--------------------
188 (Stance)
+ 1201 (Stance Background)


RscStaminaBar = 305
--------------------
193 (Stamina Bar)
*/
