/*
 * Author: PabstMirror
 * Function for sync module.  Assigns keys for all synced vehicles to any players that are synced.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [car] call ACE_VehicleLock_fnc_handleVehicleInitPost
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_vehicle);

if (!isServer) exitWith {};
if (GVAR(VehicleStartingLockState) == -1) exitWith {};

[{
    private ["_lock"];
    PARAMS_1(_vehicle);
    if ((_vehicle isKindOf "Car") || {_vehicle isKindOf "Tank"} || {_vehicle isKindOf "Helicopter"}) then {
        //set lock state (eliminates the ambigious 1-"Default" and 3-"Locked for Player" states)
        _lock = switch (GVAR(VehicleStartingLockState)) do {
        case (0): {(locked _vehicle) in [2, 3]};
        case (1):{true};
        case (2):{false};
        };
        if (((_lock) && {(locked _vehicle) != 2}) || {(!_lock) && {(locked _vehicle) != 0}}) then {
            TRACE_3("Setting Lock State",_lock,(typeOf _vehicle),_vehicle);
            ["VehicleLock_SetVehicleLock", [_vehicle], [_vehicle, _lock]] call EFUNC(common,targetEvent);
        };
    };
    //Delay call until mission start (so everyone has the eventHandler's installed)
}, [_vehicle], 0.25, 0.25] call EFUNC(common,waitAndExecute);