/*
  Name: AGM_VehicleLock_fnc_moduleSync

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

_this spawn {
  private ["_logic","_syncedObjects","_listOfVehicles"];

  _logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
  _syncedObjects = [_this, 1, [], [[]]] call BIS_fnc_param;

  if (hasInterface) then {
    waitUntil {player == player};
    waitUntil {alive player};
    sleep 5;  //need to wait for other gear-assign scripts to finish

    _listOfVehicles = []; {
      if ((_x isKindOf "Car") || (_x isKindOf "Tank") || (_x isKindOf "Helicopter")) then {
        _listOfVehicles pushBack _x;
      };
    } forEach _syncedObjects;

    if ((count _listOfVehicles) == 0) exitWith {
      ["AGM_VehicleLock_fnc_moduleSync: no valid vehicles synced"] call BIS_fnc_error;
    };

    if (player in _syncedObjects) then {
      {
        [player, _x, true] call AGM_VehicleLock_fnc_addKeyForVehicle;
      } forEach _listOfVehicles;
    };
  };
};
