#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Handles AI spawn and requests a rebalance if applicable.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_headless_fnc_handleSpawn
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("Spawn",_unit);

// Exit if unit is player
if (isPlayer _unit) exitWith {};

// Exit and blacklist if unit is UAV
if (unitIsUAV _unit) exitWith {
    _unit setVariable [QXGVAR(blacklist), true];
};

// Rebalance
[false] call FUNC(rebalance);
