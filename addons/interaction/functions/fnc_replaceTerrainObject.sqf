#include "script_component.hpp"
/*
 * Author: Dystopian
 * Replaces terrain object with created one.
 * Run on server only.
 *
 * Arguments:
 * 0: Terrain object <OBJECT>
 * 1: New object class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "Land_Bucket_F"] call ace_interaction_fnc_replaceTerrainObject
 *
 * Public: No
 */

params ["_terrainObject", "_class"];
TRACE_2("",_terrainObject,_class);

if (isObjectHidden _terrainObject) exitWith {};

private _position = getPosATL _terrainObject;
if (_position select 2 < 0) then {
    _position set [2, 0];
};
private _vectorDirAndUp = [vectorDir _terrainObject, vectorUp _terrainObject];

hideObjectGlobal _terrainObject;
// prevent new object clipping with old one
_terrainObject setDamage [1, false];

private _newObject = createVehicle [_class, [0,0,0]];
_newObject setVectorDirAndUp _vectorDirAndUp;
_newObject setPosATL _position;
