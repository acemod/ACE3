#include "script_component.hpp"
/*
 * Author: commy2, esteldunedain
 * Converts number to hexadecimal number
 *
 * Arguments:
 * A number between 0 and 255 <NUMBER>
 *
 * Return Value:
 * A hexadecimal number as string <STRING>
 *
 * Example:
 * [154] call ace_common_fnc_toHex
 *
 * Public: Yes
 */

params ["_number"];

_number = ((round abs _number) max 0) min 255;

if (isNil QGVAR(hexArray)) then {
    GVAR(hexArray) = [];

    private _minLength = 2;

    for [{_i = 0;}, {_i < 256}, {_i = _i + 1}] do {
        private _num = _i;
        private _hex = ["", "0"] select (_i == 0);

        while {_num > 0} do {
            private _rest = _num mod 16;
            _rest = switch _rest do {
                case 10 : {"A"};
                case 11 : {"B"};
                case 12 : {"C"};
                case 13 : {"D"};
                case 14 : {"E"};
                case 15 : {"F"};
                default {str _rest};
            };
            _num = floor (_num / 16);
            _hex = _rest + _hex;
        };

        while {count toArray _hex < _minLength} do {
            _hex = "0" + _hex;
        };

        GVAR(hexArray) pushBack _hex;
    };
};

GVAR(hexArray) select _number // return
