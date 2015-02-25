/*
Name: ACE_VehicleLock_fnc_moduleInit

Author: Pabst Mirror

Description:
  Function for setup module.  Sets default lockpick strength, auto handout keys, and default lock state.

Parameters:
  0: OBJECT - logic
  1: ignored
  2: BOOL - Module Activated
Returns:
  Nothing

Example:
  called from module
*/

#include "script_component.hpp"

private ["_sideKeysAssignment", "_setLockState", "_lock"];

PARAMS_3(_logic,_syncedUnits,_activated);

if (!_activated) exitWith {WARNING("Vehicle Lock Init Module - placed but not active");};

_sideKeysAssignment = _logic getVariable["SideKeysAssignment", 0];
_setLockState = _logic getVariable["SetLockState", 0];

if (isServer) then {
  [_logic, QGVAR(DefaultLockpickStrength), "LockpickStrength"] call EFUNC(common,readSettingFromModule);
};

//Run at mission start (anyone besides JIPs)
if (isServer || {player == player}) then {
  {
    if ((local _x) && {(_x isKindOf "Car") || (_x isKindOf "Tank") || (_x isKindOf "Helicopter")}) then {
      //set lock state (eliminates the ambigious 1-"Default" and 3-"Locked for Player" states)
      _lock = switch (_setLockState) do {
      case (0): {(locked _x) in [2, 3]};
      case (1):{true};
      case (2):{false};
      };
      if (((_lock) && {(locked _x) != 2}) || {(!_lock) && {(locked _x) != 0}}) then {
        TRACE_3("Setting Lock State", _lock, (typeOf _x), _x);
        ["SetVehicleLock", [_x, _lock]] call EFUNC(common,localEvent);
      };
    };
  } forEach vehicles;
};
