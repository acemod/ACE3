/*
 * Author: esteldunedain
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

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

GVAR(Module) = true;

[_logic, QGVAR(playerNamesViewDistance),  "playerNamesViewDistance"     ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showNamesForAI),           "showNamesForAI"              ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showVehicleCrewInfo),      "showVehicleCrewInfo"         ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showCursorTagForVehicles), "showCursorTagForVehicles"    ] call EFUNC(common,readSettingFromModule);

// Do Not Force - read module setting only non-default is set due to using SCALAR
if ((_logic getVariable "showPlayerNames") != -1) then {
    [_logic, QGVAR(showPlayerNames),      "showPlayerNames"             ] call EFUNC(common,readSettingFromModule);
};

diag_log text "[ACE]: NameTags Module Initialized.";
