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
    private _sanitizedName = [name _unit, true] call FUNC(sanitizeString);
    private _rawName = [name _unit, false] call FUNC(sanitizeString);
    
    //Debug Testing Code (with html tags):    
    // private _sanitizedName = ["<TAG>Name", true] call FUNC(sanitizeString);
    // private _rawName = ["<TAG>Name", false] call FUNC(sanitizeString);
    
    //if (_name != _unit getVariable ["ACE_Name", ""]) then {
    _unit setVariable ["ACE_Name", _sanitizedName, true];
    _unit setVariable ["ACE_NameRaw", _rawName, true];
    //};
};
