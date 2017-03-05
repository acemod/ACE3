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

params ["_unit"];

private _posASL = getPosASL _unit;

if (!("ACE_Sandbag_empty" in items _unit) ||
    {(getPosATL _unit) select 2 > 0.05} || // Walking on objects, such as buildings, pavements, etc.
    {surfaceIsWater _posASL} // posATL in low water (not as low to allow awalking) is negative
) exitWith {false};

private _surfaceClass = (surfaceType _posASL) select [1];
private _surfaceType = getText (configFile >> "CfgSurfaces" >> _surfaceClass >> "soundEnviron");
TRACE_1("Surface",_surfaceType);

!(_surfaceType in SURFACE_BLACKLIST)
