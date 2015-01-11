// by commy2

private ["_array", "_value", "_min", "_max"];

_array = _this select 0;
_value = _this select 1;

_min = _array select floor _value;
_max = _array select ceil _value;

_min + (_max - _min) * (_value % 1)
