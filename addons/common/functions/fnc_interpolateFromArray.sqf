/*
 * Author: commy2
 * Interpolates between two set points in a curve.
 *
 * Arguments:
 * 0: List of numbers to interpolate from <ARRAY>
 * 1: Value / index <NUMBER>
 *
 * Return Value:
 * Interpolation result <NUMBER>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_array", "_value"];

private ["_min", "_max"];

_min = _array select floor _value;
_max = _array select ceil _value;

_min + (_max - _min) * (_value % 1) // return
