#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Adds user input affecting carrying back.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_dragging_fnc_resumeCarry;
 *
 * Public: No
 */

params ["_unit"];

// If not dragging, don't do anything
if !(_unit getVariable [QGVAR(isCarrying), false]) exitWith {};

// If action is already present, don't add it again
if (!isNil {_unit getVariable QGVAR(releaseActionID)}) exitWith {};

// Remove drop action
_unit setVariable [QGVAR(releaseActionID), [
    _unit, "DefaultAction",
    {!isNull ((_this select 0) getVariable [QGVAR(carriedObject), objNull])},
    {[_this select 0, (_this select 0) getVariable [QGVAR(carriedObject), objNull], true] call FUNC(dropObject_carry)}
] call EFUNC(common,addActionEventHandler)];

// Show mouse hint (done in FUNC(carryObjectPFH))
_unit setVariable [QGVAR(hint), nil];
