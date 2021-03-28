#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Trues the muzzle velocity
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_true_muzzle_velocity
 *
 * Public: No
 */

private _referenceDrop = GVAR(truingDropDropData) select 0;
private _actualDrop = GVAR(truingDropDropData) select 1;

if (Round(_actualDrop * 10) / 10 == Round(_referenceDrop * 10) / 10) exitWith {};

private _step = 10;
if (_actualDrop > _referenceDrop) then {
    _step = -10;
};

private _solutionInput = +GVAR(targetSolutionInput);
_solutionInput set [ 8, 200];
_solutionInput set [13, GVAR(truingDropRangeData) select 0];
private _muzzleVelocity = _solutionInput select 4;

{
    _step = _step * _x;
    while { _actualDrop * _step < _referenceDrop * _step } do {
        _muzzleVelocity = _muzzleVelocity + _step;
        _solutionInput set [4, _muzzleVelocity];
        private _result = _solutionInput call FUNC(calculate_solution);
        _referenceDrop = (_result select 0);
    };
} forEach [1, -0.1];

GVAR(truingDropMuzzleVelocity) = _muzzleVelocity;
