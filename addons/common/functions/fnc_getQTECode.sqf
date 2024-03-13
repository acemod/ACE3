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

params ["_len"];
_code = [];
for "_i" from 0 to _len do {
    _code pushBack (selectRandom ["↑", "↓", "→", "←"]);
};
_code;
