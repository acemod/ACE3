/*
 * Author: PabstMirror
 * Function for sync module.  Assigns keys for all synced vehicles to any players that are synced.
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
 * [fromModule] call ACE_VehicleLock_fnc_moduleSync;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_logic,_syncedObjects,_activated);

if !(_activated) exitWith {WARNING("Vehicle Lock Sync Module - placed but not active");};
if (!isServer) exitWith {};

[{
    private ["_listOfVehicles"];
    PARAMS_1(_syncedObjects);
    _listOfVehicles = [];
    {
        if ((_x isKindOf "Car") || (_x isKindOf "Tank") || (_x isKindOf "Helicopter")) then {
            _listOfVehicles pushBack _x;
        };
    } forEach _syncedObjects;

    if ((count _listOfVehicles) == 0) exitWith {  //Verbose error for mission makers (only shows on server)
        ["ACE_VehicleLock_fnc_moduleSync: no vehicles synced"] call BIS_fnc_error;
    };

    {
        private "_unit";
        _unit = _x;
        if (_unit isKindOf "CAManBase") then {
            {
                [_unit, _x, true] call FUNC(addKeyForVehicle);
            } forEach _listOfVehicles;
        };
    } forEach _syncedObjects;

    //Wait to add keys until various gear assigns have finished (~5 seconds)
}, [_syncedObjects], 5, 1] call EFUNC(common,waitAndExecute);
