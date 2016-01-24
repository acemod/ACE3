/*
 * Author: Ruthberg, commy2, esteldunedain
 * Checks if a unit can dig a trench
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Trench type <STRING>
 *
 * Return Value:
 * Can dig <BOOL>
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_canDigTrench
 *
 * Public: No
 */
#include "script_component.hpp"

#define SURFACE_BLACKLIST ["water", "concrete", "tarmac", "wood", "metal", "roof_tin", "roof_tiles", "wood_int", "concrete_int", "tiles_int", "metal_int", "stony", "rock", "int_concrete", "int_tiles", "int_wood", "tiling", "wavymetal", "int_metal"]

params ["_unit","_trenchTypeName"];

if !("ACE_EntrenchingTool" in items _unit) exitWith {false};

// Can't dig trench if above ground level
if ((getPosATL _unit) select 2 > 0.05) exitWith {false};

private ["_surfaceClass", "_surfaceType"];

_surfaceClass = (surfaceType getPosASL _unit) select [1];
_surfaceType = getText (configFile >> "CfgSurfaces" >> _surfaceClass >> "soundEnviron");
TRACE_1("",_surfaceType);

!(_surfaceType in SURFACE_BLACKLIST)
