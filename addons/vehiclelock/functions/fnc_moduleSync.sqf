#include "script_component.hpp"
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

if (!isServer) exitWith {};

params ["_logic", "_syncedObjects", "_activated"];
TRACE_3("params",_logic,_syncedObjects,_activated);

if !(_activated) exitWith {WARNING("Vehicle Lock Sync Module - placed but not active");};

[{
    params ["_syncedObjects"];

    private _listOfVehicles = _syncedObjects select {
        private _object = _x;
        #define CLASSNAMES ["Car", "Tank", "Air"]
        IS_KIND_OF_ANY(_object,CLASSNAMES)
    };

    if (_listOfVehicles isEqualTo []) exitWith {  //Verbose error for mission makers (only shows on server)
        ["ACE_VehicleLock_fnc_moduleSync: no vehicles synced"] call BIS_fnc_error;
    };

    {
        private _unit = _x;
        if (_unit isKindOf "CAManBase") then {
            {
                [_unit, _x, true] call FUNC(addKeyForVehicle);
            } forEach _listOfVehicles;
        };
    } forEach _syncedObjects;

    //Wait to add keys until various gear assigns have finished (~5 seconds)
}, [_syncedObjects], 5, 1] call CBA_fnc_waitAndExecute;
