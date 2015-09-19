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
 * [car2, x, player] call ACE_attach_fnc_handleGetIn
 *
 * Public: No
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["", "", "_unit"];
TRACE_1("params",_unit);

private ["_attachedList"];

_attachedList = _unit getVariable [QGVAR(attached), []];
if ((count _attachedList) == 0) exitWith {};

(_attachedList select 0) params ["_xObject"];
if (!isNull _xObject) then {
    detach _xObject;
    _xObject setPos ((getPos _unit) vectorAdd [0, 0, -1000]);
    [{deleteVehicle (_this select 0)}, [_xObject], 2] call EFUNC(common,waitAndExecute);
    (_attachedList select 0) set [0, objNull];
};

_unit setVariable [QGVAR(attached), _attachedList, true];
