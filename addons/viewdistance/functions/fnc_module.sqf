/*
 * Author: Winter
 * Initialises the view distance limiter module
 * 
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
 * 
 */

#include "script_component.hpp"

if (!isServer) exitWith {};

PARAMS_3(_logic,_units,_activated);

if (!_activated) exitWith {
    diag_log text "[ACE]: View Distance Limit Module is placed but NOT active.";
};

GVAR(modulePresent) = true;

[_logic, QGVAR(moduleViewDistanceLimit),"moduleViewDistanceLimit"] call EFUNC(common,readSettingFromModule);

hint format["[ACE]: View Distance Limit Module Initialized with limit: %1",GVAR(moduleViewDistanceLimit)]; // only used for debug, GVAR(moduleViewDistanceLimit) keeps returning as ANY. Remember to remove before finalising the module.
diag_log format["[ACE]: View Distance Limit Module Initialized with limit: %1",GVAR(moduleViewDistanceLimit)];