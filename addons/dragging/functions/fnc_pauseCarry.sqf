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
 * player call ace_dragging_fnc_pauseCarry;
 *
 * Public: No
 */

params ["_unit"];

// If not carrying, don't do anything
if !(_unit getVariable [QGVAR(isCarrying), false]) exitWith {};

private _actionID = _unit getVariable QGVAR(releaseActionID);

// If action has already been removed, don't remove it again
if (isNil "_actionID") exitWith {};

// Remove drop action
[_unit, "DefaultAction", _actionID] call EFUNC(common,removeActionEventHandler);
_unit setVariable [QGVAR(releaseActionID), nil];

// Hide mouse hint
_unit setVariable [QGVAR(hint), "paused"];
call EFUNC(interaction,hideMouseHint);
