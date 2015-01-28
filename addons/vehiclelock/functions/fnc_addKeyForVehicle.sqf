/*
  Name: ACE_VehicleLock_fnc_addKeyForVehicle

  Author: Pabst Mirror

  Description:
    Adds a key to a unit that will open a vehicle

  Parameters:
    0: OBJECT - unit
    1: OBJECT - vehicle
    2: BOOL - custom key (true: custom key (magazine)  -  false: side key (item))

  Returns:
    Nothing

  Example:
    [bob, car1, true] call ACE_VehicleLock_fnc_addKeyForVehicle;
*/

#include "script_component.hpp"

private ["_unit","_veh","_useCustom","_previousMags","_newMags","_keyMagazine","_keyName"];

_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_veh = [_this, 1, objNull, [objNull]] call bis_fnc_param;
_useCustom = [_this, 2, false, [false]] call bis_fnc_param;

if (isNull _unit) exitWith {["addKeyForVehicleClient: null unit"] call BIS_fnc_error;};
if (isNull _veh) exitWith {["addKeyForVehicleClient: null vehicle"] call BIS_fnc_error;};

if (_useCustom) then {
  _previousMags = magazinesDetail _unit;
  _unit addMagazine ["ACE_key_customKeyMagazine", 1];
  _newMags = (magazinesDetail _unit) - _previousMags;
  if ((count _newMags) == 0) exitWith {
    ["ACE_VehicleLock_fnc_addKeyForVehicle: failed to add magazine (inventory full?)"] call BIS_fnc_error;
  };
  _keyMagazine = _newMags select 0;
  TRACE_2("setting up key on server",_veh,_keyMagazine);
  ["SetupCustomKey", [_veh, _keyMagazine]] call EFUNC(common,serverEvent);
} else {
  _keyName = [_veh] call FUNC(getVehicleSideKey);
  _unit addItem _keyName;
};
