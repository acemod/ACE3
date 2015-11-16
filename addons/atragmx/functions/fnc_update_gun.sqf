/*
 * Author: Ruthberg
 * Updates all gun column input fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_gun
 *
 * Public: No
 */
#include "script_component.hpp"

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

ctrlSetText [1000, _profile];
if (GVAR(currentUnit) != 2) then {
    ctrlSetText [100, Str(Round(_boreHeight / 2.54 * 100) / 100)];
    ctrlSetText [110, Str(Round(_bulletMass * 15.4323584))];
    ctrlSetText [130, Str(Round(_muzzleVelocity * 3.2808399))];
} else {
    ctrlSetText [100, Str(Round((_boreHeight * 100) / 100))];
    ctrlSetText [110, Str(Round(_bulletMass))];
    ctrlSetText [130, Str(Round(_muzzleVelocity))];
};

if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    ctrlSetText [120, Str(Round((GVAR(workingMemory) select 15) * 1000) / 1000)];
} else {
    ctrlSetText [120, Str(Round((GVAR(workingMemory) select 4) * -1000 * 1000) / 1000)];
};

switch (GVAR(currentUnit)) do {
    case 0: {
        ctrlSetText [140, format["*%1", Round(_range)]];
    };
    case 1: {
        ctrlSetText [140, Str(Round((_range) * 1.0936133))];
    };
    case 2: {
        ctrlSetText [140, Str(Round(_range))];
    };
};
[] call FUNC(update_scope_unit);
