/*
	 * Author: john681611
	 * Generates a Quick time Event code.
	 *
	 * Argument: CodeLength (pos Number)
	 * 0: CodeLength <NUMBER>
	 *
	 * Return Value:
	 * Array - ["↑", "↑", "↓", "→", "←"]
	 *
	 * Example:
	 * 5 call ace_common_fnc_getQuickTimeEventCode
	 *
	 * Public: Yes
 */

params ["_len"];
_code = [];
for "_i" from 0 to _len do {
	_code pushBack (selectRandom ["↑", "↓", "→", "←"]);
};
_code;
