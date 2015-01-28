/*
Name: ACE_VehicleLock_fnc_moduleSync

Author: Pabst Mirror

Description:
  Function for sync module.  Assigns keys for all synced vehicles to any players that are synced.

Parameters:
  0: OBJECT - logic
  1: ARRAY - synced objects (only objects at mission start, so JIP without AI won't be present)

Returns:
  Nothing

Example:
  called from module
*/

#include "script_component.hpp"

PARAMS_3(_logic,_syncedObjects,_activated);

if !(_activated) exitWith {WARNING("Vehicle Lock Sync Module - placed but not active");};
if (!isServer) exitWith {};

_addKeyAfterGearAssign = {
  private ["_syncedObjects", "_listOfVehicles"];
  _syncedObjects = _this select 0;
  _listOfVehicles = [];
  {
    if ((_x isKindOf "Car") || (_x isKindOf "Tank") || (_x isKindOf "Helicopter")) then {
      _listOfVehicles pushBack _x;
    };
  } forEach _syncedObjects;

  if ((count _listOfVehicles) == 0) exitWith {  //Verbose error for mission makers
    ["ACE_VehicleLock_fnc_moduleSync: no vehicles synced"] call BIS_fnc_error;
  };

  {
    _unit = _x;
    if (_unit isKindOf "CAManBase") then {
      {
        [_unit, _x, true] call FUNC(addKeyForVehicle);
      } forEach _listOfVehicles;
    };
  } forEach _syncedObjects;
};

//Wait to add keys until various gear assigns have finished (~5 seconds)
[_addKeyAfterGearAssign, [_syncedObjects], 5, 1] call EFUNC(common,waitAndExecute);
