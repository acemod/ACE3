/*
 * Author: Rocko and esteldunedain
 * Calculates the current map illumination for a given unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * 0: Does the map needs shading? <BOOL>
 * 1: Color of the overlay <ARRAY>
 *
 * Example:
 * [player] call ACE_map_fnc_determineMapLight
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit"];

// Blend two colors
private _fnc_blendColor = {
    params ["_c1", "_c2", "_alpha"];
    [(_c1 select 0) * (1 - _alpha) + (_c2 select 0) * _alpha,
    (_c1 select 1) * (1 - _alpha) + (_c2 select 1) * _alpha,
    (_c1 select 2) * (1 - _alpha) + (_c2 select 2) * _alpha,
    (_c1 select 3) * (1 - _alpha) + (_c2 select 3) * _alpha]
};

// Ambient light tint depending on time of day
private _lightTint = call {
    if (sunOrMoon == 1.0) exitWith {[0.5,0.5,0.5,1]};
    if (sunOrMoon > 0.80) exitWith {[[1.0 - overcast,0.2,0,1], [1,1,1,1],   (sunOrMoon - 0.8) / 0.2] call _fnc_blendColor};
    if (sunOrMoon > 0.50) exitWith {[[0,0,0.1,1], [1.0 - overcast,0.2,0,1], (sunOrMoon - 0.5) / 0.3] call _fnc_blendColor};
    if (sunOrMoon <= 0.5) exitWith {[0,0,0.1,1]};
    [0,0,0,0]
};

private _lightLevel = 0.04 + (0.96 * call EFUNC(common,ambientBrightness));

// Do not obscure the map if the ambient light level is above 0.95
if (_lightLevel > 0.95) exitWith {
    [false, [1,1,1,0]]
};

private _vehicle = vehicle _unit;

// Do not obscure the map if the player is on a enclosed vehicle (assume internal illumination)
if ((_vehicle != _unit) && {(!isTurnedOut _unit)} && GVAR(vehicleLightCondition) && {!((_unit call CBA_fnc_turretPath) in GVAR(vehicleExteriorTurrets))}) exitWith {
    TRACE_1("Player in a enclosed vehicle",GVAR(vehicleLightColor));
    [!(GVAR(vehicleLightColor) isEqualTo [1,1,1,0]), GVAR(vehicleLightColor)]
};

// Player is not in a vehicle
TRACE_1("Player is on foot or in an open vehicle","");

// Check if player is near a campfires, streetlamps, units with flashlights, vehicles with lights on, etc. - 40m
{
    _lightLevel = _lightLevel max ([_unit, _x] call EFUNC(common,lightIntensityFromObject));
} forEach nearestObjects [_unit, ["All"], 40];

// @todo: Illumination flares (timed)

// Using chemlights
private _nearObjects = (_unit nearObjects ["Chemlight_base", 4]) select {alive _x};

if !(_nearObjects isEqualTo []) then {
    private _nearestlight = _nearObjects select 0;
    private _lightLevelTemp = (1 - ((((_unit distance _nearestlight) - 2) / 2) max 0)) * 0.4;
    if (_lightLevelTemp > _lightLevel) then {
        private _flareTint = getArray (configFile >> "CfgLights" >> (getText (configFile >> (getText (configFile >> "CfgAmmo" >> typeOf _nearestlight >> "EffectsSmoke")) >> "Light1" >> "type")) >> "color");
        _lightTint = [_lightTint, _flareTint, (_lightLevelTemp - _lightLevel) / (1 - _lightLevel)] call _fnc_blendColor;
        _lightLevel = _lightLevelTemp;
        TRACE_1("player near chemlight","");
    };
};

// Do not obscure the map if the ambient light level is above 0.95
if (_lightLevel > 0.95) exitWith {
    [false, [1,1,1,0]]
};

// Calculate resulting map color from tint and light level
private _halfLight = _lightLevel / 0.5;

private _finalLevel = if (_lightLevel < 0.5) then {
    [(_lightTint select 0) * _halfLight,
    (_lightTint select 1) * _halfLight,
    (_lightTint select 2) * _halfLight,
    (_lightTint select 3) * (1 - _lightLevel)]
} else {
    _halfLight = (_lightLevel - 0.5) / 0.5;
    [(_lightTint select 0) * (1 - _halfLight) + _halfLight,
    (_lightTint select 1) * (1 - _halfLight) + _halfLight,
    (_lightTint select 2) * (1 - _halfLight) + _halfLight,
    (_lightTint select 3) * (1 - _lightLevel)]
};

[true, _finalLevel]
