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

diag_log text "[ACE]: View Distance Limit Module Initialized.";

[_logic, QGVAR(limit),"moduleViewDistanceLimit"] call EFUNC(common,readSettingFromModule);