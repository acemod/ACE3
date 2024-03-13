/*
	 * Author: john681611
	 * Formats QTE code into something displayable.
	 *
	 * Argument: 
	 * 0: QTE Code <ARRAY>
	 * Return Value:
	 * STRING - "↑     ↑     ↓     →     ←"
	 *
	 * Example:
	 * [["↑", "↓", "→", "←"]] call ace_common_fnc_getFormattedQuickTimeEventCode
	 *
	 * Public: Yes
 */

params ["_code"];
_val = _code joinString "     "; // Arma doesn't know how to space ↑ so we need loads of spaces between
_val;
