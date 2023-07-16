#include "script_component.hpp"
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

params ["_unit"];

private _vehicle = vehicle _unit;

// Do not obscure the map if the player is on a enclosed vehicle (assume internal illumination)
if (
    _vehicle != _unit
    && {!isTurnedOut _unit}
    && GVAR(vehicleLightCondition)
    && {!((_unit call CBA_fnc_turretPath) in GVAR(vehicleExteriorTurrets))}
) exitWith {
    TRACE_1("Player in a enclosed vehicle",GVAR(vehicleLightColor));
    [GVAR(vehicleLightColor) isNotEqualTo [1,1,1,0], GVAR(vehicleLightColor)]
};

// Player is not in a vehicle
TRACE_1("Player is on foot or in an open vehicle","");

getLightingAt _unit params ["_ambientLightColor", "_ambientLightBrightness", "_dynamicLightColor", "_dynamicLightBrightness"];

private _brightness = _ambientLightBrightness + _dynamicLightBrightness;
if (_brightness > 3000) exitWith {[false, [1,1,1,0]]};

private _alfa = switch (true) do {
    case (_brightness <= 0.2): { 1 };
    case (_brightness <= 2):    { linearConversion [0.2, 2, _brightness, 1, 0.86] };
    case (_brightness <= 10):   { linearConversion [2, 10, _brightness, 0.86, 0.6] };
    case (_brightness <= 100):  { linearConversion [10, 100, _brightness, 0.6, 0.3] };
    case (_brightness <= 200):  { linearConversion [100, 200, _brightness, 0.3, 0.14] };
    default                     { linearConversion [200, 3000, _brightness, 0.14, 0] };
};

private _finalLightColor = [];
{
    private _finalColor = (_ambientLightBrightness * _x + _dynamicLightBrightness * (_dynamicLightColor select _forEachIndex)) / _brightness;
    if (_alfa > 0.5) then {
        _finalColor = _finalColor * (1 - _alfa) / 3;
    };
    _finalLightColor pushBack _finalColor;
} forEach _ambientLightColor;

_finalLightColor pushBack _alfa;

[true, _finalLightColor]
