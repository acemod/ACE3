/*
 * Author: Ruthberg
 * Rectifies the muzzle velocity vs. temperature interpolation data
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_rectify_muzzle_velocity
 *
 * Public: No
 */
#include "script_component.hpp"

private _minTemp = -50;

{
    private _temp = _x select 0;
    if (_temp < _minTemp) then {
        _x set [0, _minTemp];
    } else {
        if ((_x select 1) > 0) then {
            _minTemp = _temp;
        };
    };
} forEach (GVAR(workingMemory) select 18);
