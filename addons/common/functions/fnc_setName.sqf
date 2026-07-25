#include "..\script_component.hpp"
/*
 * Author: commy2, DartRuffian
 * Sets the name variable of the object. Used to prevent issues with the name command.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Force set name (optional, default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_common_fnc_setName
 *
 * Public: No
 */

params ["_unit", ["_forceSet", false]];

private _name = name _unit;

TRACE_3("setName",_unit,alive _unit,_name);

if (isNull _unit || {!alive _unit} || { !(_unit isKindOf "CAManBase") }) exitWith {};

if (_forceSet || _unit isNil "ACE_Name") then {
    private _sanitizedName = [_name, true] call FUNC(sanitizeString);
    private _rawName = [_name, false] call FUNC(sanitizeString);

    _unit setVariable ["ACE_Name", _sanitizedName, true];
    _unit setVariable ["ACE_NameRaw", _rawName, true];
};
