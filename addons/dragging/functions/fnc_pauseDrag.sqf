#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Removes user input affecting dragging.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_dragging_fnc_pauseDrag;
 *
 * Public: No
 */

params ["_unit"];

// If not dragging, don't do anything
if !(_unit getVariable [QGVAR(isDragging), false]) exitWith {};

// If action has already been removed, don't remove it again
if (isNil QGVAR(releaseActionID)) exitWith {};

// Remove drop action
[GVAR(releaseActionID), "keydown"] call CBA_fnc_removeKeyHandler;
GVAR(releaseActionID) = nil;

// Hide mouse hint
call EFUNC(interaction,hideMouseHint);
