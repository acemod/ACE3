#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, johnb43
 * Start fire in engine block of a car.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_cookoff_fnc_engineFireServer
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_vehicle"];

// If already smoking, stop
if (_vehicle getVariable [QGVAR(isEngineSmoking), false]) exitWith {};

_vehicle setVariable [QGVAR(isEngineSmoking), true, true];

// Spawn engine fire effects on all connected machines
private _jipID = [QGVAR(engineFireLocal), [_vehicle, CBA_missionTime + random [ENGINE_FIRE_TIME / 2, ENGINE_FIRE_TIME, ENGINE_FIRE_TIME / 2 * 3]]] call CBA_fnc_globalEventJIP;
[_jipID, _vehicle] call CBA_fnc_removeGlobalEventJIP;

_vehicle setVariable [QGVAR(engineFireJipID), _jipID];

// API
[QGVAR(engineFire), [_vehicle]] call CBA_fnc_globalEvent;
