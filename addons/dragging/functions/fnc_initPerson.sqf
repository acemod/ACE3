#include "script_component.hpp"
/*
 * Author: commy2
 * Initialize variables for drag or carryable persons. Called from init EH.
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

[_unit, true, [0,1.1,0.092], 180] call FUNC(setDraggable);
[_unit, true, [0.4,-0.1,-1.25], 195] call FUNC(setCarryable); // hard-coded selection: "LeftShoulder"
