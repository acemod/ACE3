#include "..\script_component.hpp"
/*
 * Author: commy2
 * Initialize variables for draggable / carryable persons. Called from init EH.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_dragging_fnc_initPerson;
 *
 * Public: No
 */

params ["_unit"];
if (isNull _unit) exitWith { WARNING_1("%1 became null",_unit) };

[_unit, true, [0, 1.1, 0.092], 180] call FUNC(setDraggable);
[_unit, true, [0.4, -0.1, -1.25], 195] call FUNC(setCarryable); // Hard-coded selection: "LeftShoulder"
