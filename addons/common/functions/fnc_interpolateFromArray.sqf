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

private _min = _array select floor _value;
private _max = _array select ceil _value;

linearConversion [0, 1, _value % 1, _min, _max] // return
