/*
 * Author: commy2
 * Sets the name variable of the object. Used to prevent issues with the name command.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (isNull _unit || {!alive _unit}) exitWith {};

if (_unit isKindOf "CAManBase") then {
    _name = [name _unit, true] call FUNC(sanitizeString);

    //if (_name != _unit getVariable ["ACE_Name", ""]) then {
    _unit setVariable ["ACE_Name", _name, true];
    //};
};
