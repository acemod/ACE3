/*
 * Author: Garth 'L-H' de Wet
 * Handles rain effects being created on glasses.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_goggles_fnc_rainEffect;
 *
 * Public: No
 */
#include "script_component.hpp"

_unit = GETUNIT;

private ["_fnc_underCover"];
if (isNull _unit || {!alive _unit}) exitWith {};

_fnc_underCover = {
    private ["_pos", "_unit"];
    _unit = (_this select 0);
    if (vehicle _unit != _unit && {!([_unit] call EFUNC(common,isTurnedOut))}) exitWith {true};
    _pos = eyePos _unit;
    ((positionCameraToWorld [0,0,1] select 2) < ((positionCameraToWorld [0,0,0] select 2) - 0.4)) || {(lineIntersects [_pos, _pos vectorAdd [0,0,15], _unit])}
};

if !(isNull curatorCamera) exitWith {
    [] call FUNC(removeRainEffect);
};

// Ignore if unit is under water
if (!GVAR(EffectsActive) || {underwater _unit}) exitWith {[] call FUNC(removeRainEffect);};

if (GVAR(RainLastLevel) != rain) then {
    [] call FUNC(removeRainEffect);
    GVAR(RainLastLevel) = rain;
    // Rain is happening
    if (GVAR(RainLastLevel) > 0.05 && {!([_unit] call _fnc_underCover)}) then {
        GVAR(RainActive) = true;
        GVAR(RainDrops) = "#particlesource" createVehicleLocal getPosASL _unit;
        GVAR(RainDrops) setParticleClass "ACERainEffect";
        GVAR(RainDrops) setDropInterval (0.07 * (1.1 - GVAR(RainLastLevel)));
        GVAR(RainDrops) attachTo [vehicle _unit,[0,0,0]];
    };
}else{
    if (GVAR(RainLastLevel) > 0.05) then {
        if (GVAR(RainActive) && {[_unit] call _fnc_underCover}) exitWith {
            [] call FUNC(removeRainEffect);
        };
        if (!GVAR(RainActive)) then {
            GVAR(RainLastLevel) = -1;
        };
    };
};
