#include "script_component.hpp"
/*
 * Author: Dextro
 * Displays available Reources
 *
 * Arguments:
 *
 * Return Value:
 *
 * Example:
 * [] call ace_fortify_fnc_resourceInfo
 *
 * Public: Yes
 */

private _str = format ["%1 Resources left", ace_trenches_trenchSupplies];
[_str, 1.5] call ace_common_fnc_displayTextStructured;