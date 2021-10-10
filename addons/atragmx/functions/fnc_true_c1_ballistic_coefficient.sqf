#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Trues the c1 ballistic coefficient
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_true_c1_ballistic_coefficient
 *
 * Public: No
 */

private _referenceDrop = GVAR(truingDropDropData) select 0;
private _actualDrop = GVAR(truingDropDropData) select 2;

if (Round(_actualDrop * 10) / 10 == Round(_referenceDrop * 10) / 10) exitWith {};

private _step = 0.01;
if (_actualDrop > _referenceDrop) then {
    _step = -0.01;
};

private _solutionInput = +GVAR(targetSolutionInput);
_solutionInput set [ 8, 200];
_solutionInput set [13, GVAR(truingDropRangeData) select 1];
private _c1 = _solutionInput select 14;

{
    _step = _step * _x;
    while { _actualDrop * _step < _referenceDrop * _step } do {
        _c1 = _c1 + _step;
        _solutionInput set [14, _c1];
        private _result = _solutionInput call FUNC(calculate_solution);
        _referenceDrop = (_result select 0);
    };
} forEach [1, -0.1];

GVAR(truingDropC1) = _c1;
