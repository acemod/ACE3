#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Recalculates the c1 ballistic coefficient based on the current target range
 *
 * Arguments:
 * parse input <BOOL>
 * update display <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_recalculate_c1_ballistic_coefficient
 *
 * Public: No
 */

params ["_parseInput", "_updateDisplay"];

if (_parseInput) then {
    [] call FUNC(parse_input);
};

private _c1 = [GVAR(targetRange) select GVAR(currentTarget)] call FUNC(lookup_c1_ballistic_coefficient);

if (_c1 != GVAR(workingMemory) select 15) then {
    GVAR(workingMemory) set [15, _c1];
    if (_updateDisplay) then {
        call FUNC(update_gun);
        call FUNC(update_gun_ammo_data);
    };
};
