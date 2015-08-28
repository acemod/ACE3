/*
 * Author: Ruthberg
 * Checks if the player can deploy a sandbag
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can deploy <BOOL>
 *
 * Example:
 * [] call ace_sandbag_fnc_canDeploy
 *
 * Public: No
 */
#include "script_component.hpp"

#define SURFACE_BLACKLIST ["water", "concrete", "tarmac", "wood", "metal", "roof_tin", "roof_tiles", "wood_int", "concrete_int", "tiles_int", "metal_int", "stony", "rock", "int_concrete", "int_tiles", "int_wood", "tiling", "wavymetal", "int_metal"]

if !([ACE_player, "ACE_Sandbag_empty"] call EFUNC(common,hasItem)) exitWith { false };
if (ACE_player getVariable [QGVAR(usingSandbag), false]) exitWith { false };
if ((getPosATL ACE_player select 2) - (getPos ACE_player select 2) > 1E-5) exitWith { false };

private ["_surfaceClass", "_surfaceType"];

_surfaceClass = ([surfaceType (position ACE_player), "#"] call CBA_fnc_split) select 1;
_surfaceType = getText (configfile >> "CfgSurfaces" >> _surfaceClass >> "soundEnviron");

!(_surfaceType in SURFACE_BLACKLIST)
