/*
 * Author: Glowbal
 * Get nearest vehicle from unit that is not excluded, priority: Car-Air-Tank-Ship.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Object to exclude <OBJECT>
 *
 * Return Value:
 * Vehicle in Distance <OBJECT>
 *
 * Example:
 * [unit, object] call ace_cargo_fnc_findNearestVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_object"];

private _loadCar = nearestObjects [_unit, ["car"], MAX_LOAD_DISTANCE];
_loadCar deleteAt (_loadCar find _object);
if !(_loadCar isEqualTo []) exitWith {_loadCar select 0};

private _loadHelicopter = nearestObjects [_unit, ["air"], MAX_LOAD_DISTANCE];
_loadHelicopter deleteAt (_loadHelicopter find _object);
if !(_loadHelicopter isEqualTo []) exitWith {_loadHelicopter select 0};

private _loadTank = nearestObjects [_unit, ["tank"], MAX_LOAD_DISTANCE];
_loadTank deleteAt (_loadTank find _object);
if !(_loadTank isEqualTo []) exitWith {_loadTank select 0};

private _loadShip = nearestObjects [_unit, ["ship"], MAX_LOAD_DISTANCE];
_loadShip deleteAt (_loadShip find _object);;
if !(_loadShip isEqualTo []) exitWith {_loadShip select 0};

private _loadContainer = nearestObjects [_unit, ["Cargo_base_F"], MAX_LOAD_DISTANCE];
_loadContainer deleteAt (_loadContainer find _object);
if !(_loadContainer isEqualTo []) exitWith {_loadContainer select 0};

objNull
