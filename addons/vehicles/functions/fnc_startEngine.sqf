#include "script_component.hpp"
/*
 * Author: commy2
 * Delays engine start of vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Is Engine on <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, false] call ace_vehicles_fnc_startEngine
 *
 * Public: No
 */

params ["_vehicle", "_isEngineOn"];

if (!_isEngineOn || {floor abs speed _vehicle > 0 || {!isNull isVehicleCargo _vehicle}}) exitWith {};

private _startupDelay = _vehicle getVariable [QGVAR(engineStartDelay), getNumber (configOf _vehicle >> QGVAR(engineStartDelay))];
if (_startupDelay <= 0) exitWith {};

[{
    params ["_args", "_idPFH"];
    _args params ["_vehicle", "_time", "_direction"];

    if (CBA_missionTime > _time) exitWith { [_idPFH] call CBA_fnc_removePerFrameHandler; };

    _vehicle setVelocity [0, 0, 0];
    _vehicle setVectorDirAndUp _direction;

} , 0, [_vehicle, CBA_missionTime + _startupDelay, [vectorDir _vehicle, vectorUp _vehicle]]] call CBA_fnc_addPerFrameHandler;
