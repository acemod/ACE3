#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Starts the carrying process safely.
 *
 * Arguments:
 * 0: Unit that should do the carrying <OBJECT>
 * 1: Object to carry <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_startCarry
 *
 * Public: No
 */
params ["_unit", "_target"];

// Try to claim the object
[QEGVAR(common,claimSafe), [_unit, _target, true, QGVAR(startCarry)]] call CBA_fnc_serverEvent;
