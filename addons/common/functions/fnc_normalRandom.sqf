#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns a random variable according to a normal distribution with mean/stddev.
 * Uses Box-Muller transform to approximate distribution
 *
 * Arguments:
 * 0: Mean <NUMBER>
 * 1: Standard Deviation <NUMBER>
 *
 * Return Value:
 * Pair of random numbers according to normal distribution <ARRAY>
 *
 * Example:
 * [0.5, 0.1] call ace_common_fnc_normalRandom // e.g. returns [4, 0.1]
 *
 * Public: Yes
 */
params [["_mean", 0, [0]], ["_stddev", 1, [0]]];

private _u1 = 0;
while { _u1 == 0 } do { _u1 = random 1; };
private _u2 = random 1;

private _tau = 2 * pi;
private _theta = deg (_u2 * _tau);

private _mag = _stddev * sqrt (-2 * ln _u1);
private _z0 = _mag * cos _theta + _mean;
private _z1 = _mag * sin _theta + _mean;

[_z0, _z1]
