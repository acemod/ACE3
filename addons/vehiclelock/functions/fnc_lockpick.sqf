/*
Name: ACE_VehicleLock_fnc_lockpick

Author: Pabst Mirror

Description:
  Handles lockpick functionality from action menu.

Parameters:
  0: OBJECT - unit
  1: OBJECT - vehicle
  2: STRING - function type
  "canLockpick": returns BOOL if lockpick is possible
  "startLockpick": starts the process
  "finishLockpick": on completions, opens the lock

Returns:
  BOOL

Example:
  [ACE_player, ACE_Interaction_Target, 'canLockpick'] call ACE_VehicleLock_fnc_lockpick
*/

#include "script_component.hpp"

private ["_unit","_veh","_funcType","_vehLockpickStrenth","_returnValue"];

_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_veh = [_this, 1, objNull, [objNull]] call bis_fnc_param;
_funcType = [_this, 2, "", [""]] call bis_fnc_param;

if (isNull _unit) exitWith {
  ["ACE_VehicleLock_fnc_lockpick: null unit"] call BIS_fnc_error;
  false
};
if (isNull _veh) exitWith {
  ["ACE_VehicleLock_fnc_lockpick: null vehicle"] call BIS_fnc_error;
  false
};

//need lockpick item
if (!("ACE_key_lockpick" in (items _unit))) exitWith {
  false
};

_vehLockpickStrenth = _veh getVariable[QGVAR(lockpickStrength), GVAR(DefaultLockpickStrength)];
if (typeName _vehLockpickStrenth != "SCALAR") exitWith {
  ["ACE_VehicleLock_fnc_lockpick: 'ACE_vehicleLock_LockpickStrength' invalid: (%1)", _veh] call BIS_fnc_error;
  false
};

//-1 indicates unpickable lock
if (_vehLockpickStrenth < 0) exitWith {
  false
};

_returnValue = false;

switch (true) do {
case (_funcType == "canLockpick"): {
    _returnValue = true;
  };
case (_funcType == "startLockpick"): {
    [_vehLockpickStrenth, [_unit, _veh, "finishLockpick"], "ACE_VehicleLock_fnc_lockpick", (localize "STR_ACE_Vehicle_Action_LockpickInUse")] call EFUNC(common,progressBar);
  };
case (_funcType == "finishLockpick"): {
    ["SetVehicleLock", [_veh], [_veh, false]] call EFUNC(common,targetEvent);
  };
  default {
    ["ACE_VehicleLock_fnc_lockpick: bad function type"] call BIS_fnc_error;
  };
};

_returnValue;
