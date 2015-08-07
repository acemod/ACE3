/*
 * Author: PabstMirror
 * Sets a vehicle lock state because of a "VehicleLock_SetVehicleLock" event
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: New lock state <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank1, false] call ACE_VehicleLock_fnc_setVehicleLockEH;
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_lockNumber"];

params ["_veh", "_isLocked"];

_lockNumber = if (_isLocked) then {2} else {0};
TRACE_2("Setting Lock State", _veh, _lockNumber);
_veh lock _lockNumber;
