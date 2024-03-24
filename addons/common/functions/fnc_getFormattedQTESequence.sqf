#include "..\script_component.hpp"
/*
 * Author: john681611
 * Formats QTE code into something displayable.
 *
 * Argument: 
 * 0: QTE Code <ARRAY>
 * 
 * Return Value:
 * Formatted QTE Code <STRING>
 *
 * Example:
 * [["↑", "↓", "→", "←"]] call ace_common_fnc_getFormattedQTESequence
 *
 * Public: Yes
 */

params ["_code"];

_code joinString "     " // Arma doesn't know how to space ↑ so we need loads of spaces between
