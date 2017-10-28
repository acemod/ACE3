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
 * call ace_goggles_fnc_applyRainEffect;
 *
 * Public: No
 */
#include "script_component.hpp"

private _unit = ACE_player;

if (!alive _unit) exitWith {};

private _fnc_underCover = {
    params ["_unit"];

    if (vehicle _unit != _unit && {!isTurnedOut _unit}) exitWith {true};

    // looking up and no roof over head
    private _position = eyePos _unit;
    positionCameraToWorld [0, 0, 1] select 2 < (positionCameraToWorld [0, 0, 0] select 2) - 0.4 || {(lineIntersects [_position, _position vectorAdd [0, 0, 15], _unit])} // return
};

if (!isNull findDisplay 312) exitWith {
    if (GVAR(RainActive)) then {
        call FUNC(removeRainEffect);
    };
};

// Ignore if unit is under water
if !(GVAR(EffectsActive) || {underwater _unit}) exitWith {
    call FUNC(RemoveRainEffect);
};

if (GVAR(RainLastLevel) != rain) then {
    call FUNC(RemoveRainEffect);

    GVAR(RainLastLevel) = rain;

    // Rain is happening
    if (GVAR(RainLastLevel) > 0.05 && {!([_unit] call _fnc_underCover)}) then {
        GVAR(RainActive) = true;
        GVAR(RainDrops) = "#particlesource" createVehicleLocal position _unit;
        GVAR(RainDrops) setParticleClass "ACERainEffect";
        GVAR(RainDrops) setDropInterval (0.07 * (1.1 - GVAR(RainLastLevel)));
        GVAR(RainDrops) attachTo [vehicle _unit, [0,0,0]];
    };
} else {
    if (GVAR(RainLastLevel) > 0.05) then {
        if (GVAR(RainActive) && {[_unit] call _fnc_underCover}) exitWith {
            call FUNC(RemoveRainEffect);
        };

        if !(GVAR(RainActive)) then {
            GVAR(RainLastLevel) = -1;
        };
    };
};
