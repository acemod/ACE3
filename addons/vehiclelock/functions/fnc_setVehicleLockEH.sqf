/*
  Name: ACE_VehicleLock_fnc_setVehicleLockEH

  Author: Pabst Mirror

  Description:
    Sets a vehicle lock state because of a "SetVehicleLock" event

  Parameters:
    0: OBJECT - vehicle
    1: BOOL - new lock state

  Returns:
    Nothing

  Example:
    [tank1, false] call ACE_VehicleLock_fnc_setVehicleLockEH;
*/

#include "script_component.hpp"

private ["_veh","_isLocked","_lockNumber"];

_veh = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_isLocked = [_this, 1, false, [false]] call bis_fnc_param;

_lockNumber = if (_isLocked) then {2} else {0};

TRACE_2("Setting Lock State", _veh, _lockNumber);

_veh lock _lockNumber;

// _veh setVariable ["ACE_LockedInventory", _isLocked, true]; //todo inventory lock
