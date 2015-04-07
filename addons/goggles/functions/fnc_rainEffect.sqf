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
private ["_fnc_underCover"];
if (isNull(ace_player) || {!(alive ace_player)}) exitWith {};
_fnc_underCover = {
    private ["_pos", "_unit"];
    _unit = (_this select 0);
    if (vehicle _unit != _unit && {!([_unit] call EFUNC(common,isTurnedOut))}) exitWith {true};
    _pos = eyePos _unit;
    ((positionCameraToWorld [0,0,1] select 2) < ((positionCameraToWorld [0,0,0] select 2) - 0.4)) || {(lineIntersects [_pos, _pos vectorAdd [0,0,15], _unit])}
};
if (!isNull(findDisplay 312)) exitWith {
    if (GVAR(RainActive)) then {
        call FUNC(RemoveRainEffect);
    };
};
// Ignore if ace_player is under water
if (!GVAR(EffectsActive) || {underwater ace_player}) exitWith{call FUNC(RemoveRainEffect);};
if (GVAR(RainLastLevel) != rain) then {
    call FUNC(RemoveRainEffect);
    GVAR(RainLastLevel) = rain;
    // Rain is happening
    if (GVAR(RainLastLevel) > 0.05 && {!([ace_player] call _fnc_underCover)}) then {
        GVAR(RainActive) = true;
        GVAR(RainDrops) = "#particlesource" createVehicleLocal GetPos ace_player;
        GVAR(RainDrops) setParticleClass "ACERainEffect";
        GVAR(RainDrops) setDropInterval (0.07 * (1.1 - GVAR(RainLastLevel)));
        GVAR(RainDrops) attachTo [vehicle ace_player,[0,0,0]];
    };
}else{
    if (GVAR(RainLastLevel) > 0.05) then {
        if (GVAR(RainActive) && {[ace_player] call _fnc_underCover}) exitWith {
            call FUNC(RemoveRainEffect);
        };
        if (!GVAR(RainActive)) then {
            GVAR(RainLastLevel) = -1;
        };
    };
};
