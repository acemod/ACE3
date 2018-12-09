#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Updates the gun ammo data fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_gun_ammo_data
 *
 * Public: No
 */

ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 12008);

if (GVAR(currentUnit) != 2) then {
    ctrlSetText [120000, Str(Round((GVAR(workingMemory) select 5) / 2.54 * 100) / 100)];
} else {
    ctrlSetText [120000, Str(Round((GVAR(workingMemory) select 5) * 100) / 100)];
};
if (GVAR(currentUnit) != 2) then {
    ctrlSetText [120010, Str(Round((GVAR(workingMemory) select 12) * 15.4323584))];
} else {
    ctrlSetText [120010, Str(Round((GVAR(workingMemory) select 12) * 10) / 10)];
};
if (GVAR(currentUnit) != 2) then {
    ctrlSetText [120020, Str(Round((GVAR(workingMemory) select 13) / 10 / 2.54 * 1000) / 1000)];
} else {
    ctrlSetText [120020, Str(Round((GVAR(workingMemory) select 13) / 10 * 1000) / 1000)];
};
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    ctrlSetText [120030, Str(Round((GVAR(workingMemory) select 15) * 1000) / 1000)];
} else {
    ctrlSetText [120030, Str(Round((GVAR(workingMemory) select 4) * -1000 * 1000) / 1000)];
};
if (GVAR(currentUnit) != 2) then {
    ctrlSetText [120040, Str(Round((GVAR(workingMemory) select 14) / 2.54 * 10) / 10)];
} else {
    ctrlSetText [120040, Str(Round((GVAR(workingMemory) select 14) * 100) / 100)];
};
if (GVAR(currentUnit) != 2) then {
    ctrlSetText [120050, Str(Round((GVAR(workingMemory) select 1) * 3.2808399))];
} else {
    ctrlSetText [120050, Str(Round(GVAR(workingMemory) select 1))];
};
if (GVAR(currentUnit) == 1) then {
    ctrlSetText [120060, Str(Round((GVAR(workingMemory) select 2) * 1.0936133))];
} else {
    ctrlSetText [120060, Str(Round(GVAR(workingMemory) select 2))];
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
    ctrlSetText [12004, "Rifle Twist (in/trn)"];
    ctrlSetText [12005, "Muzzle Velocity (feet/sec)"];
};

if (GVAR(currentUnit) == 1) then {
    ctrlSetText [12006, "Zero Range (yards)"];
} else {
    ctrlSetText [12006, "Zero Range (meters)"];
};
