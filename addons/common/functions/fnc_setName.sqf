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
 * Example:
 * [bob] call ace_common_fnc_setName
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_3("setName",_unit,alive _unit,name _unit);

if (isNull _unit || {!alive _unit}) exitWith {};

if (_unit isKindOf "CAManBase") then {
    private _sanitizedName = [name _unit, true] call FUNC(sanitizeString);
    private _rawName = [name _unit, false] call FUNC(sanitizeString);

    _unit setVariable ["ACE_Name", _sanitizedName, true];
    _unit setVariable ["ACE_NameRaw", _rawName, true];
};
