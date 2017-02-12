/*
 * Author: esteldunedain
 * Change the value of an existing setting if it was not previously forced. Force if neccesary.
 * If executed on clients it has local effect.
 * If executed on server it can have global effect if the last parameter is set to true.
 *
 * Arguments:
 * 0: Setting name <STRING>
 * 1: Value <ANY>
 * 2: Force it? (default: false) <BOOL>
 * 3: Broadcast the change to all clients (default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ace_map_gestures_enabled", true, false, true] call ace_common_fnc_setSetting
 *
 * Public: No
 */
#include "script_component.hpp"

ERROR_MSG_1("ace_common_fnc_setSetting has been removed\n%1",_this);
