/*
Author: commy2

Description:
Converts number to binary number

Arguments:
A number

Return Value:
A binary number, String
*/
#include "script_component.hpp"

private ["_sign", "_bin", "_rest"];

params ["_number", ["_minLength", 1]];

_sign = ["", "-"] select (_number < 0);

_number = round abs _number;
_bin = ["", "0"] select (_number == 0);

while {_number > 0} do {
    _rest = str (_number mod 2);
    _number = floor (_number / 2);
    _bin = _rest + _bin;
};

while {count toArray _bin < _minLength} do {
    _bin = "0" + _bin;
};

_sign + _bin
