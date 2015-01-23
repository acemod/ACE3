/*
  Name: AGM_VehicleLock_fnc_serverSetupCustomKey

  Author: Pabst Mirror

  Description:
    Adds a key (magazineDetail name) to approved keys for a vehicle

  Parameters:
    0: OBJECT - vehicle
    1: STRING - Magazine Name

  Returns:
    Nothing

  Example:
    [tank1, "todo"] call AGM_VehicleLock_fnc_serverSetupCustomKey;
*/

private ["_veh","_key","_currentKeys"];

_veh =  [_this, 0, objNull, [objNull]] call bis_fnc_param;
_key =   [_this, 1, "", [""]] call bis_fnc_param;

if (!isServer) exitWith {["AGM_VehicleLock_fnc_serverSetupCustomKey: only run on server"] call BIS_fnc_error;};
if (_key == "") exitWith {["AGM_VehicleLock_fnc_serverSetupCustomKey: empty key string"] call BIS_fnc_error;};

//Want this as atomic as possible

_currentKeys = _veh getVariable ["agm_lock_customKeys", []];
_currentKeys pushBack _key;
_veh setVariable ["agm_lock_customKeys", _currentKeys, true];
