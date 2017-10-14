/*
 * Author: PabstMirror
 * Returns if user has a valid key for the vehicle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * unit has key for vehicle <BOOL>
 *
 * Example:
 * [bob, car] call ACE_VehicleLock_fnc_hasKeyForVehicle;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_veh"];
TRACE_2("params",_unit,_veh);

if (isNull _unit) exitWith {ERROR("null unit"); false};
if (isNull _veh) exitWith {ERROR("null vehicle"); false};

private _returnValue = false;

//Master can open anything "no matter what"
if ("ACE_key_master" in (items _unit)) then {_returnValue = true};

//Check side key
private _sideKeyName = [_veh] call FUNC(getVehicleSideKey);
if (_sideKeyName in (items _unit)) then {_returnValue = true};

//Check custom keys
private _customKeys = _veh getVariable [QGVAR(customKeys), []];
{
    if (_x in (magazinesDetail _unit)) then {_returnValue = true;};
} forEach _customKeys;

_returnValue
