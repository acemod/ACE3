#define COMPONENT ui
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_UI
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_UI
    #define DEBUG_SETTINGS DEBUG_SETTINGS_UI
#endif

#include "\z\ace\addons\main\script_macros.hpp"


// Elements
#define ELEMENTS_BASIC [QGVAR(soldierVehicleWeaponInfo), QGVAR(vehicleRadar), QGVAR(vehicleCompass), QGVAR(commandMenu), QGVAR(groupBar)]

// Element, IDD, IDC
#define ELEMENTS_ADVANCED [ \
    [QGVAR(weaponName), 300, [118] ], \
    [QGVAR(weaponNameBackground), 300, [1001, 1008] ], \
    [QGVAR(firingMode), 300, [187, 1203] ], \
    [QGVAR(ammoType), 300, [155] ], \
    [QGVAR(ammoCount), 300, [184] ], \
    [QGVAR(magCount), 300, [185] ], \
    [QGVAR(grenadeName), 300, [152] ], \
    [QGVAR(grenadeCount), 300, [151] ], \
    [QGVAR(weaponLowerInfoBackground), 300, [1202] ], \
    [QGVAR(zeroing), 300, [168] ], \
    [QGVAR(stance), 303, [188, 1201] ], \
    [QGVAR(vehicleName), 300, [120] ], \
    [QGVAR(vehicleNameBackground), 300, [1000, 1013] ], \
    [QGVAR(vehicleFuelBar), 300, [113, 1202] ], \
    [QGVAR(vehicleSpeed), 300, [121, 1004, 1006] ], \
    [QGVAR(vehicleAltitude), 300, [122, 1005, 1014] ], \
    [QGVAR(vehicleDamage), 300, [111] ], \
    [QGVAR(vehicleInfoBackground), 300, [1200] ], \
    [QGVAR(vehicleGunnerWeapon), 300, [150] ] \
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
*/
