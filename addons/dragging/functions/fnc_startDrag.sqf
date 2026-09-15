#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Starts the dragging process safely.
 *
 * Arguments:
 * 0: Unit that should do the carrying <OBJECT>
 * 1: Object to drag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_startDrag
 *
 * Public: No
 */

params ["_unit", "_target"];

// Try to claim the object
[QEGVAR(common,claimSafe), [_unit, _target, true, QGVAR(startDrag)]] call CBA_fnc_serverEvent;
