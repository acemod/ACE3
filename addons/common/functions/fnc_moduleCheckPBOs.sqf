/*
 * Author: KoffeinFlummi
 * Initializes the check-PBOs module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

if !(isServer) exitWith {};

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

[_logic, QGVAR(checkPBOsAction),     "Action"    ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(checkPBOsCheckAll),   "CheckAll"  ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(checkPBOsWhitelist),  "Whitelist" ] call EFUNC(common,readSettingFromModule);

diag_log text format ["[ACE]: Check-PBOs Module Initialized. Mode: %1.", GVAR(checkPBOsAction)];
