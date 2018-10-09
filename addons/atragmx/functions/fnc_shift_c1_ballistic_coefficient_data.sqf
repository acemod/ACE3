#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Shifts all c1 ballistic coefficient entries in the c1 ballistic coefficient vs. distance interpolation table
 *
 * Arguments:
 * ballistic coefficient - <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 10 call ace_atragmx_fnc_shift_c1_ballistic_coefficient_data
 *
 * Public: No
 */

if (_this == 0) exitWith {};

{
    private _c1 = _x select 1;
    if (_c1 > 0) then {
        ((GVAR(workingMemory) select 19) select _forEachIndex) set [1, 0.1 max (_c1 + _this) min 2];
    }
} forEach (GVAR(workingMemory) select 19);
