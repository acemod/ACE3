#define DEBUG_MODE_FULL
#include "script_component.hpp"
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

params ["_name", "_value", ["_force", false], ["_broadcastChanges", false]];
TRACE_4("setSetting",_name,_value,_force,_broadcastChanges);

if (!isServer) exitWith {};
if (!_broadcastChanges) exitWith {
    ERROR_1("Setting [%1] - SetSetting no longer supports non-global settings",_name);
};

if ([_settingName, "mission"] call CBA_settings_fnc_isForced) then {
    WARNING_1("Setting [%1] - Already mission forced - Ignoring",_settingName);
};

[QGVAR(setSetting), [_name, _value], (format [QGVAR(setSetting_%1), _name])] call CBA_fnc_globalEventJIP;
