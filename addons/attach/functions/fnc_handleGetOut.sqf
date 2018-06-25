#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles when a unit gets in to a vehicle.
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 * 1: dunno <OBJECT>
 * 2: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [car2, x, player] call ACE_attach_fnc_handleGetOut
 *
 * Public: No
 */

params ["", "", "_unit"];
TRACE_1("params",_unit);

if (!local _unit) exitWith {};

private _attachedList = _unit getVariable [QGVAR(attached), []];
if (_attachedList isEqualTo []) exitWith {};

(_attachedList select 0) params ["_xObject", "_xItemName"];
if (isNull _xObject) then {
    TRACE_1("null attached when exiting vehicle, scripted reattach",_xItemName);
    _unit setVariable [QGVAR(attached), [], true];
    [_unit, _unit, _xItemName, true] call FUNC(attach);
};
