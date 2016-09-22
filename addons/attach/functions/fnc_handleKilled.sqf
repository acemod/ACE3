/*
 * Author: PabstMirror
 * Handles when vehicle or man is killed. 
 * Note: Runs where unit is local.
 *
 * Arguments:
 * 0: DeadVehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob1] call ACE_attach_fnc_handleKilled
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_deadUnit"];
TRACE_1("params",_deadUnit);

private _attachedList = _deadUnit getVariable [QGVAR(attached), []];

if (_attachedList isEqualTo []) exitWith {};

{
    _x params ["_xObject"];
    TRACE_2("detaching",_xObject,_deadUnit);
    detach _xObject;
    //If it's a vehicle, also delete the attached
    if (!(_deadUnit isKindOf "CAManBase")) then {
        _xObject setPos ((getPos _deadUnit) vectorAdd [0, 0, -1000]);
        [{deleteVehicle (_this select 0)}, [_xObject], 2] call CBA_fnc_waitAndExecute;
    };
} forEach _attachedList;

_deadUnit setVariable [QGVAR(attached), nil, true];
