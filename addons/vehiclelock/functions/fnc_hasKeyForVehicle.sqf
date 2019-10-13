#include "script_component.hpp"
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

params ["_unit", "_veh"];
TRACE_2("params",_unit,_veh);

if (isNull _unit) exitWith {ERROR("null unit"); false};
if (isNull _veh) exitWith {ERROR("null vehicle"); false};

//Master can open anything "no matter what"
private _items = _unit call EFUNC(common,uniqueItems);
if ("ACE_key_master" in _items) exitWith {true};

//Check side key
private _sideKeyName = [_veh] call FUNC(getVehicleSideKey);
if (_sideKeyName in _items) exitWith {true};

//Check custom keys
private _customKeys = _veh getVariable [QGVAR(customKeys), []];
private _magazines = magazinesDetail _unit;

(_customKeys findIf {_x in _magazines}) != -1
