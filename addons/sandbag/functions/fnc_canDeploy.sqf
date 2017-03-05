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

if !("ACE_Sandbag_empty" in items _unit) exitWith {false};

private _surfaceClass = (surfaceType getPosASL _unit) select [1];
private _surfaceType = getText (configFile >> "CfgSurfaces" >> _surfaceClass >> "soundEnviron");
TRACE_1("Surface",_surfaceType);

!(_surfaceType in SURFACE_BLACKLIST)
