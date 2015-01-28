	/*
  Name: ACE_VehicleLock_fnc_serverSetupCustomKeyEH

  Author: Pabst Mirror

  Description:
    Adds a key (magazineDetail name) to approved keys for a vehicle

  Parameters:
    0: OBJECT - vehicle
    1: STRING - Magazine Name

  Returns:
    Nothing

  Example:
    [tank1, "someMagainze [id xx:yy]"] call ACE_VehicleLock_fnc_serverSetupCustomKeyEH;
*/

#include "script_component.hpp"

private ["_currentKeys"];

PARAMS_2(_veh,_key);

if (!isServer) exitWith {ERROR("only run on server");};
if (_key == "") exitWith {ERROR("empty key string");};

_currentKeys = _veh getVariable [QGVAR(customKeys), []];
_currentKeys pushBack _key;
_veh setVariable [QGVAR(customKeys), _currentKeys, true];
