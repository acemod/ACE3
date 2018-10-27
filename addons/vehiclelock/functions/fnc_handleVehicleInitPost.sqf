#include "script_component.hpp"
/*
 * Author: PabstMirror
 * For every lockable vehicle, sets the starting lock state to a sane value.
 * Only run if the enabled via settings
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

params ["_vehicle"];
TRACE_1("handleVehicleInitPost",_vehicle);

if (alive _vehicle) then {
    //set lock state (eliminates the ambigious 1-"Default" and 3-"Locked for Player" states)
    private _lock = switch (GVAR(VehicleStartingLockState)) do {
        case 0: {locked _vehicle in [2, 3]};
        case 1: {true};
        case 2: {false};
    };
    if ((_lock && {locked _vehicle != 2}) || {!_lock && {locked _vehicle != 0}}) then {
        TRACE_3("Setting Lock State",_lock,typeOf _vehicle,_vehicle);
        [QGVAR(SetVehicleLock), [_vehicle, _lock], [_vehicle]] call CBA_fnc_targetEvent;
    };
};
