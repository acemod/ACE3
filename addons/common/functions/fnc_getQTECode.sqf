/*
 * Author: john681611
 * Generates a Quick time Event code.
 *
 * Arguments:
 * 0: CodeLength <NUMBER>
 *
 * Return Value:
 * QTE Code eg: ["↑", "↑", "↓", "→", "←"] <ARRAY>
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
