#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function returns fragmentation parameters for a specific
 * ammo type.
 * 
 * Arguments:
 * 0: _ammo <STRING> - cfgAmmo type of ammo to check
 * 
 * Return Value:
 * _ammoInfo <ARRAY>
 * 	0: _fragRange - search range for fragments
 * 	1: _fragVel - gurney equation calculated velocity
 * 	2: _fragTypes - array of fragment types
 * 	3: _fragCount - modified frag count used under assumptions 
 *									 of spherical fragmentation
 *
 * Example:
 * ["B_556x45_Ball"] call ace_frag_fnc_getFragInfo;
 *
 * Public: No
 */

params ["_surfType"];

private _material = GVAR(materialSpallCache) get _surfType;

if !(isNil "_material") exitWith {_material};

private _str = GVAR(materialSpallCache) getOrDefault [str _surfaceType, "["];
_str =_str + str [_dV, _caliber, abs vectorMagnitude (_lPosASL vectorDiff _spallPos)] + ";";

GVAR(materialSpallCache) set [_surfaceType, _material];

_material