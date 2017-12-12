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
private _config = configFile >> "CfgSurfaces" >> _surfaceClass;
private _surfaceType = getText (_config >> "soundEnviron");
private _surfaceDust = getNumber (_config >> "dust");
private _isWhitelisted = getNumber (_config >> "ACE_digWhitelisted") == 1;
private _isBlacklisted = getNumber (_config >> "ACE_digBlacklisted") == 1;
TRACE_2("Surface",_surfaceType,_surfaceDust);

!(_isBlacklisted || _surfaceType in DIG_SURFACE_BLACKLIST) && {(_surfaceDust >= 0.1) || {_isWhitelisted} || {_surfaceType in DIG_SURFACE_WHITELIST}}
