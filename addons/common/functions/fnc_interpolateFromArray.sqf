// by commy2
#include "script_component.hpp"

private ["_min", "_max"];

params ["_array", "_value"];

_min = _array select floor _value;
_max = _array select ceil _value;

_min + (_max - _min) * (_value % 1)
