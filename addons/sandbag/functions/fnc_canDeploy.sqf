/*
 * Author: Ruthberg, commy2
 * Checks if the player can deploy a sandbag
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can deploy <BOOL>
 *
 * Example:
 * [ACE_player] call ace_sandbag_fnc_canDeploy
 *
 * Public: No
 */
#include "script_component.hpp"

#define SURFACE_BLACKLIST ["water", "concrete", "tarmac", "wood", "metal", "roof_tin", "roof_tiles", "wood_int", "concrete_int", "tiles_int", "metal_int", "stony", "rock", "int_concrete", "int_tiles", "int_wood", "tiling", "wavymetal", "int_metal"]

params ["_unit"];

if !("ACE_Sandbag_empty" in items _unit) exitWith {false};

private ["_surfaceClass", "_surfaceType"];

_surfaceClass = (surfaceType getPosASL _unit) select [1];
_surfaceType = getText (configFile >> "CfgSurfaces" >> _surfaceClass >> "soundEnviron");

!(_surfaceType in SURFACE_BLACKLIST)
