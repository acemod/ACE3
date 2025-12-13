#include "..\script_component.hpp"
/*
 * Author: Ruthberg, commy2
 * Checks if the player can dig on the surface below (enough dust).
 *
 * Arguments:
 * 0: Unit or Position (2d/3d) <OBJECT or ARRAY>
 *
 * Return Value:
 * Can Dig <BOOL>
 *
 * Example:
 * [ACE_player] call ace_common_fnc_canDig
 * [[1000,2000]] call ace_common_fnc_canDig
 *
 * Public: No
 */

params ["_input"];

private _posASL = _input;

if ((_input isEqualType objNull) && {
    _posASL = getPosASL _input;
    (getPosATL _input) select 2 > 0.05 || // Walking on objects, such as buildings, pavements, etc.
    {surfaceIsWater _posASL} // posATL in low water (not as low to allow walking) is negative
}) exitWith {false};

private _surfaceClass = (surfaceType _posASL) select [1];
private _config = configFile >> "CfgSurfaces" >> _surfaceClass;

TRACE_3("",_surfaceClass,getText (_config >> "soundEnviron"),getNumber (_config >> "dust"));

if (isNumber (_config >> "ACE_canDig")) then {
    (getNumber (_config >> "ACE_canDig")) == 1 // return
} else {
    private _surfaceType = getText (_config >> "soundEnviron");
    GVAR(canDigSurfaces) getOrDefault [_surfaceType, getNumber (_config >> "dust") >= 0.1, true] // return
};
