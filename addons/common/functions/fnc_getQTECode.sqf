#include "..\script_component.hpp"
/*
 * Author: john681611
 * Generates a Quick time Event code (= a random sequence of arrow characters of a given length).
 *
 * Arguments:
 * 0: Code length <NUMBER>
 *
 * Return Value:
 * Array of arrow characters <ARRAY>
 *
 * Example:
 * 5 call ace_common_fnc_getQTECode
 *
 * Public: Yes
 */

params [["_length", 0, [0]];

if (_length <= 0) exitWith {[]};

private _code = [];

for "_i" from 0 to _length do {
    _code pushBack (selectRandom ["↑", "↓", "→", "←"]);
};

_code
