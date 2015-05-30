/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: ?
 * 1: ?
 * 2: ?
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

if (count _this < 3) exitwith {};

[QGVAR(orbatElements), _this] call FUNC(syncedArrayUpdate);
