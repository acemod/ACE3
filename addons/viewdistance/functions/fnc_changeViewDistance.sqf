/*
 * Author: Winter
 * Sets the player's current view distance according to allowed values.
 * 
 *
 * Arguments:
 * 0: View Distance Setting (SCALAR)
 *
 * Return Value:
 * None
 *
 * Example:
 * [1500] call ace_common_fnc_imanexample
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_new_view_distance"];

_new_view_distance = _this select 0;

player setViewDistance (_new_view_distance);