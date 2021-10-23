#include "script_component.hpp"
/*
 * Author: Jonpas
 * Handles AI spawn and requests a rebalance if applicable.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object] call ace_headless_fnc_handleSpawn
 *
 * Public: No
 */

params ["_object"];
TRACE_1("Spawn",_object);

// Exit if HC transferring disabled or object not a unit (including unit inside vehicle) or is player
if (!(_object in allUnits) || {isPlayer _object}) exitWith {};

// Exit and blacklist if of blacklist type
if ({_object isKindOf _x} count GVAR(blacklistType) > 0) exitWith {
    _object setVariable [QXGVAR(blacklist), true];
};

// Rebalance
[false] call FUNC(rebalance);
