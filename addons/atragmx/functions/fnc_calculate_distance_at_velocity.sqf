#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates distance at which the bullet velocity drops below the threshold velocity
 *
 * Arguments:
 * theshold velocity <NUMBER>
 *
 * Return Value:
 * distance <NUMBER>
 *
 * Example:
 * 403 call ace_atragmx_fnc_calculate_distance_at_velocity
 *
 * Public: No
 */

#define __DELTA_T 0.001

if (isNil QGVAR(targetSolutionInput)) exitWith { 0 };

private _thresholdVelocity = _this;
private _velocity = GVAR(targetSolutionInput) select 4;

if (_velocity <= _thresholdVelocity) exitWith { 0 };

private _distance = 0;

while {_velocity > _thresholdVelocity} do {
    private _bc = GVAR(targetSolutionInput) select 14;
    private _dragModel = GVAR(targetSolutionInput) select 15;
    private _temperature = GVAR(targetSolutionInput) select 5;
    _distance = _distance + _velocity * __DELTA_T;
    private _data = (
        "ace" callExtension ["ballistics:retard", [
            _dragModel,
            _bc,
            _velocity,
            _temperature
        ]]
    ) select 0;
    _velocity = _velocity - ((parseNumber _data) * __DELTA_T);
};

_distance
