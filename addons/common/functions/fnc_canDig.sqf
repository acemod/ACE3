/*
 * Author: Ruthberg, commy2
 * Checks if the player can dig on the surface below (enough dust).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can Dig <BOOL>
 *
 * Example:
 * [ACE_player] call ace_common_fnc_canDig
 *
 * Public: No
 */
#include "script_component.hpp"

#define SURFACE_BLACKLIST [ \
    "concrete", "concrete_exp", "concrete_int", "int_concrete", "int_concrete_exp", \
    "pavement_exp", "int_pavement_exp", \
    "tiling", "tiles_int", "int_tiles", \
    "roof_tin", "roof_tiles", "rooftiles_exp", \
    "tarmac", "asphalt_exp", \
    "stones_exp", "rock", "stony", \
    "metal", "gridmetal_exp", "metalplate_exp", "int_metalplate_exp", "metal_int", "wavymetal", "wavymetal_exp", "int_metal", "steel_exp", \
    "lino_exp", "int_lino_exp", "int_mat_exp", \
    "wood", "wood_int", "int_wood", "softwood_exp", "int_softwood_exp", "int_solidwood_exp" \
]

params ["_unit"];

private _posASL = getPosASL _unit;

if ((getPosATL _unit) select 2 > 0.05 || // Walking on objects, such as buildings, pavements, etc.
    {surfaceIsWater _posASL} // posATL in low water (not as low to allow awalking) is negative
) exitWith {false};

private _surfaceClass = (surfaceType _posASL) select [1];
private _surfaceType = getText (configFile >> "CfgSurfaces" >> _surfaceClass >> "soundEnviron");
private _surfaceDust = getNumber (configFile >> "CfgSurfaces" >> _surfaceClass >> "dust");
TRACE_2("Surface",_surfaceType,_surfaceDust);

!(_surfaceType in SURFACE_BLACKLIST) && {_surfaceDust >= 0.1}
