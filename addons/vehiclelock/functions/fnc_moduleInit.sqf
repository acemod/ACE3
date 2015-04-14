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
#include "script_component.hpp"

private ["_sideKeysAssignment", "_setLockState", "_lock"];

PARAMS_3(_logic,_syncedUnits,_activated);

if (!_activated) exitWith {WARNING("Vehicle Lock Init Module - placed but not active");};
if (!isServer) exitWith {};

//Set the GVAR for default lockpick strength
[_logic, QGVAR(DefaultLockpickStrength), "DefaultLockpickStrength"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(LockVehicleInventory), "LockVehicleInventory"] call EFUNC(common,readSettingFromModule);

_setLockState = _logic getVariable["SetLockState", 0];
[{
    PARAMS_1(_setLockState);
    {
        if ((_x isKindOf "Car") || {_x isKindOf "Tank"} || {_x isKindOf "Helicopter"}) then {
            //set lock state (eliminates the ambigious 1-"Default" and 3-"Locked for Player" states)
            _lock = switch (_setLockState) do {
            case (0): {(locked _x) in [2, 3]};
            case (1):{true};
            case (2):{false};
            };
            if (((_lock) && {(locked _x) != 2}) || {(!_lock) && {(locked _x) != 0}}) then {
                TRACE_3("Setting Lock State", _lock, (typeOf _x), _x);
                ["VehicleLock_SetVehicleLock", [_x], [_x, _lock]] call EFUNC(common,targetEvent);
            };
        };
    } forEach vehicles;
    //Delay call until mission start (so everyone has the eventHandler's installed)
}, [_setLockState], 0.25, 0.25] call EFUNC(common,waitAndExecute);
