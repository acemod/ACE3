#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Initializes unit variables.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Is Respawned <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, false] call ace_fire_fnc_initUnit
 *
 * Public: No
 */

params ["_unit", ["_isRespawn", true]];
TRACE_2("initUnit",_unit,_isRespawn);

if (!_isRespawn) then { // Always add respawn EH (same as CBA's onRespawn=1)
    _unit addEventHandler ["Respawn", {[(_this select 0), true] call FUNC(initUnit)}];
};

if (!local _unit) exitWith {};

if (_isRespawn) then {
    TRACE_1("resetting all vars on respawn",_isRespawn);

    _unit setVariable [QGVAR(intensity), nil, true];
    _unit setVariable [QGVAR(stopDropRoll), nil, true];
};
