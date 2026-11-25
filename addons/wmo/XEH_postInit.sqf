#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Engine objects with no CfgVehicles entry to carry GVAR(walkable).
// Base classes, matched with isKindOf so subclasses are covered too.
GVAR(excludedClasses) = [
    "RopeSegment"                   // fast rope segments, fixes Bloodwyn/Arma-3-WMO#5
];

// typeOf -> excluded, so the isKindOf walk is paid once per class.
GVAR(excludedCache) = createHashMap;

GVAR(anchor) = objNull;
GVAR(collisionEnabled) = true;

// The invisible roadway placed under the unit, so the engine has something solid
// beneath their feet while the anchor moves.
GVAR(roadwayHelper) = createVehicleLocal [QGVAR(roadway), [0, 0, 0], [], 0, "CAN_COLLIDE"];
GVAR(roadwayHelper) setMass 0;

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    GVAR(frameHandler) = addMissionEventHandler ["EachFrame", {call FUNC(handleFrame)}];
}] call CBA_fnc_addEventHandler;

["CBA_settingChanged", {
    params ["_setting", "_value"];

    if (_setting isNotEqualTo QGVAR(enabled)) exitWith {};

    if (_value) then {
        if (isNil QGVAR(frameHandler)) then {
            GVAR(frameHandler) = addMissionEventHandler ["EachFrame", {call FUNC(handleFrame)}];
        };
    } else {
        if (!isNil QGVAR(frameHandler)) then {
            removeMissionEventHandler ["EachFrame", GVAR(frameHandler)];
            GVAR(frameHandler) = nil;
        };
        call FUNC(detach);
    };
}] call CBA_fnc_addEventHandler;

[QEGVAR(common,playerChanged), {
    params ["_newPlayer", "_oldPlayer"];

    _oldPlayer removeEventHandler ["HandleDamage", _oldPlayer getVariable [QGVAR(damageHandler), -1]];
    _oldPlayer setVariable [QGVAR(damageHandler), nil];

    // Collision is disabled while anchored, so damage from the anchor has to be
    // suppressed. The handler follows the controlled unit.
    _newPlayer setVariable [
        QGVAR(damageHandler),
        _newPlayer addEventHandler ["HandleDamage", {call FUNC(handleDamage)}]
    ];
}] call CBA_fnc_addEventHandler;
