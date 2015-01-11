/*
  Name: AGM_VehicleLock_fnc_lockpick

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
    [AGM_player, AGM_Interaction_Target, 'canLockpick'] call AGM_VehicleLock_fnc_lockpick
*/
private ["_unit","_veh","_funcType","_vehLockpickStrenth","_returnValue"];

_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_veh = [_this, 1, objNull, [objNull]] call bis_fnc_param;
_funcType = [_this, 2, "", [""]] call bis_fnc_param;

if (isNull _unit) exitWith {
  ["AGM_VehicleLock_fnc_lockpick: null unit"] call BIS_fnc_error;
  false
};
if (isNull _veh) exitWith {
  ["AGM_VehicleLock_fnc_lockpick: null vehicle"] call BIS_fnc_error;
  false
};

//need lockpick item
if (!("AGM_item_key_lockpick" in (items _unit))) exitWith {
  false
};

_vehLockpickStrenth = _veh getVariable["agm_vehicleLock_pickStr", AGM_VehicleLock_DefaultLockpickStrength];
if (typeName _vehLockpickStrenth != "SCALAR") exitWith {
  ["AGM_VehicleLock_fnc_lockpick: agm_vehicleLock_pickStr invalid: (%1)", _veh] call BIS_fnc_error;
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
      [_vehLockpickStrenth, [_unit, _veh, "finishLockpick"], "AGM_VehicleLock_fnc_lockpick", (localize "STR_AGM_Vehicle_Action_LockpickInUse")] call AGM_Core_fnc_progressBar;
    };
  case (_funcType == "finishLockpick"): {
      [_veh, false] call AGM_VehicleLock_fnc_setVehicleLock;
    };
  default {
    ["AGM_VehicleLock_fnc_lockpick: bad function type"] call BIS_fnc_error;
  };
};

_returnValue;
