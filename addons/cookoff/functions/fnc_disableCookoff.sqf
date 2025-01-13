#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Disables cookoff for objects. Use in init fields.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_cookoff_fnc_disableCookoff
 *
 * Public: No
 */

params ["_object"];

_object setVariable [QGVAR(enable), false];
_object setVariable [QGVAR(enableAmmoCookoff), false];
