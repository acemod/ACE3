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
 */

#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {
    ACE_LOGWARNING("View Distance Limit Module is placed but NOT active.");
};

[_logic, QGVAR(enabled),"moduleViewDistanceEnabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(limitViewDistance),"moduleViewDistanceLimit"] call EFUNC(common,readSettingFromModule);

ACE_LOGINFO_1("View Distance Limit Module Initialized. Limit set by module: %1",GVAR(limitViewDistance));
