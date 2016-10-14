/*
 * Author: Glowbal
 * Get nearest vehicle from unit, priority: Car-Air-Tank-Ship.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Vehicle in Distance <OBJECT>
 *
 * Example:
 * [unit] call ace_cargo_fnc_findNearestVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_object"];

private _loadCar = nearestObjects [_unit, ["car"], MAX_LOAD_DISTANCE];
private _index = _loadCar find _object;
if (_index > -1) then {_loadCar deleteAt _index};
if !(_loadCar isEqualTo []) exitWith {_loadCar select 0};


private _loadHelicopter = nearestObjects [_unit, ["air"], MAX_LOAD_DISTANCE];
_index = _loadHelicopter find _object;
if (_index > -1) then {_loadHelicopter deleteAt _index};
if !(_loadHelicopter isEqualTo []) exitWith {_loadHelicopter select 0};


private _loadTank = nearestObjects [_unit, ["tank"], MAX_LOAD_DISTANCE];
_index = _loadTank find _object;
if (_index > -1) then {_loadTank deleteAt _index};
if !(_loadTank isEqualTo []) exitWith {_loadTank select 0};


private _loadShip = nearestObjects [_unit, ["ship"], MAX_LOAD_DISTANCE];
_index = _loadShip find _object;
if (_index > -1) then {_loadShip deleteAt _index};
if !(_loadShip isEqualTo []) exitWith {_loadShip select 0};


private _loadContainer = nearestObjects [_unit, ["Cargo_base_F"], MAX_LOAD_DISTANCE];
_index = _loadContainer find _object;
if (_index > -1) then {_loadContainer deleteAt _index};
if !(_loadContainer isEqualTo []) exitWith {_loadContainer select 0};

objNull
