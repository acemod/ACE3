/*
 * Author: PabstMirror
 * For every lockable vehicle, sets the starting lock state to a sane value.
 * Only run if the InitModule is placed.
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

if (!isServer) exitWith {};

params ["_vehicle"];
TRACE_1("params",_vehicle);

[{
    //If the module wasn't placed, just exit (needs to be in wait because objectInitEH is before moduleInit)
    if (GVAR(VehicleStartingLockState) == -1) exitWith {};

    private ["_lock"];

    params ["_vehicle"];

    if ((_vehicle isKindOf "Car") || {_vehicle isKindOf "Tank"} || {_vehicle isKindOf "Helicopter"}) then {
        //set lock state (eliminates the ambigious 1-"Default" and 3-"Locked for Player" states)
        _lock = switch (GVAR(VehicleStartingLockState)) do {
            case (0): { (locked _vehicle) in [2, 3] };
            case (1): { true };
            case (2): { false };
        };
        if ((_lock && {(locked _vehicle) != 2}) || {!_lock && {(locked _vehicle) != 0}}) then {
            TRACE_3("Setting Lock State",_lock,(typeOf _vehicle),_vehicle);
            [QGVAR(SetVehicleLock), [_vehicle, _lock], [_vehicle]] call CBA_fnc_targetEvent;
        };
    };
    //Delay call until mission start (so everyone has the eventHandler's installed)
}, [_vehicle], 0.25] call CBA_fnc_waitAndExecute;
