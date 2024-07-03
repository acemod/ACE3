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

// Exit if unit is player or UAV crew
if (isPlayer _unit || {unitIsUAV _unit}) exitWith {};

// Rebalance
[false] call FUNC(rebalance);
