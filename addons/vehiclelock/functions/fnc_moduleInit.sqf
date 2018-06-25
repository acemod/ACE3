#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Function for setup module.  Sets default lockpick strength and default lock state.
 *
 * Arguments:
 * 0: The Module Logic Object <OBJECT>
 * 1: synced objects <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [fromModule] call ACE_VehicleLock_fnc_hasKeyForVehicle;
 *
 * Public: No
 */

params ["_logic", "_syncedUnits", "_activated"];
TRACE_3("params",_logic,_syncedUnits,_activated);

if (!_activated) exitWith {WARNING("Vehicle Lock Init Module - placed but not active");};

//Set the GVAR for default lockpick strength
[_logic, QGVAR(DefaultLockpickStrength), "DefaultLockpickStrength"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(LockVehicleInventory), "LockVehicleInventory"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(VehicleStartingLockState), "VehicleStartingLockState"] call EFUNC(common,readSettingFromModule);
