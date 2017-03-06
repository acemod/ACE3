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

params ["_unit"];

private _posASL = getPosASL _unit;

if ((getPosATL _unit) select 2 > 0.05 || // Walking on objects, such as buildings, pavements, etc.
    {surfaceIsWater _posASL} // posATL in low water (not as low to allow awalking) is negative
) exitWith {false};

private _surfaceClass = (surfaceType _posASL) select [1];
private _surfaceDust = getNumber (configFile >> "CfgSurfaces" >> _surfaceClass >> "dust");
TRACE_1("Surface",_surfaceDust);

_surfaceDust >= 0.1
