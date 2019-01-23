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

    private _digits = [
        "0","1","2","3","4","5","6","7",
        "8","9","A","B","C","D","E","F"
    ];

    {
        private _x1 = _x;

        {
            GVAR(hexArray) pushBack (_x1 + _x);
        } forEach _digits;
    } forEach _digits;
};

GVAR(hexArray) select _number // return
