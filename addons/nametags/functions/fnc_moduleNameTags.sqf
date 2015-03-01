/*
 * Author: CAA-Picard
 *
 * Initializes the name tags module.
 *
 * Arguments:
 * Whatever the module provides.
 *
 * Return Value:
 * None
 */

#include "script_component.hpp"

if !(isServer) exitWith {};

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

GVAR(Module) = true;

[_logic, QGVAR(PlayerNamesViewDistance),  "PlayerNamesViewDistance"     ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(ShowNamesForAI),           "ShowNamesForAI"              ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showVehicleCrewInfo),      "showVehicleCrewInfo"         ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showCursorTagForVehicles),  "showCursorTagForVehicles"    ] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: NameTags Module Initialized.";
