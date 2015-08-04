/*
 * Author: Ruthberg
 * Updates the gun ammo data fields
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_update_gun_ammo_data
 *
 * Public: No
 */
#include "script_component.hpp"

ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 12008);

GVAR(workingMemory) params [
    "_profile", // 0
    "_muzzleVelocity", // 1
    "_range", // 2
    "_scopeBaseAngle", // 3
    "_airFriction", // 4
    "_boreHeight", // 5
    "", // 6
    "", // 7
    "", // 8
    "", // 9
    "", // 10
    "", // 11
    "_bulletMass", // 12
    "_bulletDiameter", // 13
    "_barrelTwist", // 14
    "_bc", // 15
    "_dragModel", // 16
    "_atmosphereModel" // 17
];

if (GVAR(currentUnit) != 2) then {
    ctrlSetText [120000, Str(Round(_boreHeight / 2.54 * 100) / 100)];
    ctrlSetText [120010, Str(Round(_bulletMass * 15.4323584))];
    ctrlSetText [120020, Str(Round((GVAR(workingMemory) select 13) / 10 / 2.54 * 1000) / 1000)];
    ctrlSetText [120040, Str(Round(_barrelTwist / 2.54 * 10) / 10)];
    ctrlSetText [120050, Str(Round(_muzzleVelocity * 3.2808399))];
} else {
    ctrlSetText [120000, Str(Round((GVAR(workingMemory) select 5) * 100) / 100)];
    ctrlSetText [120010, Str(Round(_bulletMass))];
    ctrlSetText [120020, Str(Round(_bulletDiameter / 10 * 1000) / 1000)];
    ctrlSetText [120040, Str(Round(_barrelTwist * 100) / 100)];
    ctrlSetText [120050, Str(Round(_muzzleVelocity))];
};


if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    ctrlSetText [120030, Str(Round(_bc * 1000) / 1000)];
} else {
    ctrlSetText [120030, Str(Round(_airFriction * -1000 * 1000) / 1000)];
};

if (GVAR(currentUnit) == 1) then {
    ctrlSetText [120060, Str(Round(_range * 1.0936133))];
    ctrlSetText [12006, "Zero Range (yards)"];
} else {
    ctrlSetText [120060, Str(Round(_range))];
    ctrlSetText [12006, "Zero Range (meters)"];
};
if (GVAR(currentUnit) == 0) then {
    ctrlSetText [120061, "*"];
} else {
    ctrlSetText [120061, ""];
};

if (GVAR(currentUnit) == 2) then {
    ctrlSetText [12000, "Bore       (cm)"];
    ctrlSetText [12001, "Bullet Weight (grams)"];
    ctrlSetText [12002, "Bullet Diam  (cm)"];
    ctrlSetText [12004, "Rifle Twist (cm/trn)"];
    ctrlSetText [12005, "Muzzle Velocity (m/s)"];
} else {
    ctrlSetText [12000, "Bore       (inches)"];
    ctrlSetText [12001, "Bullet Weight (grains)"];
    ctrlSetText [12002, "Bullet Diam  (inches)"];
    ctrlSetText [12004, "Rifle Twist (inches/trn)"];
    ctrlSetText [12005, "Muzzle Velocity (feet/sec)"];
};
