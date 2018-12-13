#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the range card output based on the current data set
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_calculate_range_card
 *
 * Public: No
 */

GVAR(rangeCardData) = [];

private _targetRange = GVAR(rangeCardEndRange);
if (GVAR(currentUnit) == 1) then {
    _targetRange = _targetRange / 1.0936133;
};

private _solutionInput = +GVAR(targetSolutionInput);
_solutionInput set [ 8, round(_solutionInput select 4)];
_solutionInput set [13, _targetRange];
_solutionInput set [17, true];

if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    private _c1 = [_targetRange] call FUNC(lookup_c1_ballistic_coefficient);
    _solutionInput set [14, _c1];
};

private _result = _solutionInput call FUNC(calculate_solution);
