#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns a random variable according to a normal distribution with mean/stddev.
 * Uses Box-Muller transform to approximate distribution
 *
 * Arguments:
 * 0: Mean <NUMBER or ARRAY>
 * 1: Standard Deviation <NUMBER or ARRAY>
 *
 * Return Value:
 * Pair of random numbers according to normal distribution <ARRAY>
 *
 * Example:
 * [0.5, [0.1, 5]] call ace_common_fnc_normalRandom // e.g. returns [4, 0.1]
 *
 * Public: Yes
 */
params [["_mean", 0, [0, []]], ["_stddev", 1, [0, []]]];

private _u1 = 0;
while { _u1 == 0 } do { _u1 = random 1; };
private _u2 = random 1;

private _mean0 = _mean;
private _mean1 = _mean;
if (_mean isEqualType []) then {
    _mean0 = _mean select 0;
    _mean1 = _mean select 1;
};

private _stddev0 = _stddev;
private _stddev1 = _stddev;
if (_stddev isEqualType []) then {
    _stddev0 = _stddev select 0;
    _stddev1 = _stddev select 1;
};

private _tau = 2 * pi;
private _theta = deg (_u2 * _tau);

private _sqrt = sqrt (-2 * ln _u1);

private _mag0 = _stddev0 * _sqrt;
private _mag1 = _stddev1 * _sqrt;
private _z0 = _mag0 * cos _theta + _mean0;
private _z1 = _mag1 * sin _theta + _mean1;

[_z0, _z1]
