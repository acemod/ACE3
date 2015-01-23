/*
  Name: AGM_VehicleLock_fnc_hasKeyForVehicle

  Author: Pabst Mirror

  Description:
    Returns if user has a valid key for the vehicle

  Parameters:
    0: OBJECT - unit
    1: OBJECT - vehicle

  Returns:
    BOOL - unit has key for vehicle

  Example:
    [bob, car] call AGM_VehicleLock_fnc_hasKeyForVehicle;
*/

private ["_unit","_veh","_returnValue","_sideKeyName","_customKeys"];

_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_veh =   [_this, 1, objNull, [objNull]] call bis_fnc_param;

if (isNull _unit) exitWith {["AGM_VehicleLock_fnc_hasKeyForVehicle: null unit"] call BIS_fnc_error; false};
if (isNull _veh)  exitWith {["AGM_VehicleLock_fnc_hasKeyForVehicle: null vehicle"] call BIS_fnc_error; false};

_returnValue = false;

//Master can open anything "no matter what"
if ("AGM_item_key_master" in (items _unit)) then {_returnValue = true};

//Check side key
_sideKeyName = [_veh] call AGM_VehicleLock_fnc_getVehicleSideKey;
if (_sideKeyName in (items _unit)) then {_returnValue = true};

//Check custom keys
_customKeys = _veh getVariable ["agm_lock_customKeys", []];
{
  if (_x in (magazinesDetail _unit)) then {_returnValue = true;};
} forEach _customKeys;

_returnValue
