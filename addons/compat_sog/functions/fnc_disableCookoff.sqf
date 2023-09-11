#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Disables cookoff for bicycles.
 *
 * Arguments:
 * 0: Bicycle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bicycle] call ace_compat_sog_fnc_disableCookoff
 *
 * Public: No
 */

params ["_bicycle"];

_bicycle setVariable [QEGVAR(cookoff,enable), false];
_bicycle setVariable [QEGVAR(cookoff,enableAmmoCookoff), false];
