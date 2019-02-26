#include "script_component.hpp"
/*
 * Author: Winter
 * Initializes the view distance limiter module.
 *
 * Arguments:
 * 0: logic <OBJECT>
 * 1: Synchronised Units <ARRAY>
 * 2: Module Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC; [bob, kevin], true] call ace_viewdistance_fnc_initModule
 *
 * Public: No
 */

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {
    WARNING("View Distance Limit Module is placed but NOT active.");
};

[_logic, QGVAR(enabled),"moduleViewDistanceEnabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(limitViewDistance),"moduleViewDistanceLimit"] call EFUNC(common,readSettingFromModule);

INFO_1("View Distance Limit Module Initialized. Limit set by module: %1",GVAR(limitViewDistance));
