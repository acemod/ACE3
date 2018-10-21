#include "script_component.hpp"
/*
 * Author: PabstMirror
 * On the server: Adds a key (magazineDetail name) to approved keys for a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Magazine Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank1, "someMagainze [id xx:yy]"] call ACE_VehicleLock_fnc_serverSetupCustomKeyEH
 *
 * Public: Yes
 */

params ["_veh", "_key"];
TRACE_2("params",_veh,_key);

if (!isServer) exitWith {ERROR("only run on server");};
if (isNull _veh) exitWith {ERROR("null vehicle");};
if (_key == "") exitWith {ERROR("empty key string");};

private _currentKeys = _veh getVariable [QGVAR(customKeys), []];
_currentKeys pushBack _key;
_veh setVariable [QGVAR(customKeys), _currentKeys, true];
