#include "script_component.hpp"
/*
 * Author: commy2
 * Converts number to binary number
 *
 * Arguments:
 * A number <NUMBER>
 *
 * Return Value:
 * A binary number as string <STRING>
 *
 * Example:
 * [5] call ace_common_fnc_toBin
 *
 * Public: Yes
 */

params ["_number", ["_minLength", 1]];

private _sign = ["", "-"] select (_number < 0);

_number = round abs _number;
private _bin = ["", "0"] select (_number == 0);

while {_number > 0} do {
    private _rest = str (_number mod 2);
    _number = floor (_number / 2);
    _bin = _rest + _bin;
};

while {count toArray _bin < _minLength} do {
    _bin = "0" + _bin;
};

_sign + _bin // return
