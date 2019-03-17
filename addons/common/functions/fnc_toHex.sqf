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

GVAR(hexArray) select _number // return
