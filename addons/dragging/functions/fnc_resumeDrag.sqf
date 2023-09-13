#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Adds user input affecting dragging back.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_dragging_fnc_resumeDrag;
 *
 * Public: No
 */

params ["_unit"];

// If not dragging, don't do anything
if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {};

// If action is already present, don't add it again
if (!isNil QGVAR(releaseActionID)) exitWith {};

// Add drop action
GVAR(releaseActionID) = [0xF1, [false, false, false], {
    [GVAR(unit), GVAR(unit) getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
}, "keydown", "", false, 0] call CBA_fnc_addKeyHandler;

// Show mouse hint
["", LLSTRING(Drop)] call EFUNC(interaction,showMouseHint);
