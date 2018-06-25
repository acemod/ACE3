#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Sets a vehicle lock state because of a "ace_vehiclelock_setVehicleLock" event
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

params ["_veh", "_isLocked"];
TRACE_2("params",_veh,_isLocked);

private _lockNumber = [0, 2] select _isLocked;
TRACE_2("Setting Lock State", _veh, _lockNumber);
_veh lock _lockNumber;
