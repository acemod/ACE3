/*
 * Author: GitHawk
 * Disables rearm for a vehicle.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Disable <BOOL><OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tank] call ace_rearm_fnc_disable
 * [tank, false] call ace_rearm_fnc_disable
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]], ["_disable", true, [true]]];
_target setVariable [QGVAR(disabled), _disable, true];
