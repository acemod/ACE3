#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Shifts all muzzle velocity entries in the muzzle velocity vs. temperature interpolation table
 *
 * Arguments:
 * velocity - <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 10 call ace_atragmx_fnc_shift_muzzle_velocity_data
 *
 * Public: No
 */

if (_this == 0) exitWith {};

{
    private _velocity = _x select 1;
    if (_velocity > 0) then {
        ((GVAR(workingMemory) select 18) select _forEachIndex) set [1, 0 max (_velocity + _this) min 1400];
    }
} forEach (GVAR(workingMemory) select 18);
