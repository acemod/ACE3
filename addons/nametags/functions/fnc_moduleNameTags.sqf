#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Initializes the name tags module.
 *
 * Arguments:
 * Whatever the module provides.
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_nametags_fnc_moduleNameTags
 *
 * Public: No
 */

params ["_logic", "", "_activated"];

if !(_activated) exitWith {};

GVAR(Module) = true;

[_logic, QGVAR(playerNamesViewDistance),  "playerNamesViewDistance"     ] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showCursorTagForVehicles), "showCursorTagForVehicles"    ] call EFUNC(common,readSettingFromModule);

// Do Not Force - read module setting only non-default is set due to using SCALAR
if ((_logic getVariable "showPlayerNames") != -1) then {
    [_logic, QGVAR(showPlayerNames),      "showPlayerNames"             ] call EFUNC(common,readSettingFromModule);
};
if ((_logic getVariable "showNamesForAI") != -1) then {
    [_logic, QGVAR(showNamesForAI),      "showNamesForAI"             ] call EFUNC(common,readSettingFromModule);
};
if ((_logic getVariable "showVehicleCrewInfo") != -1) then {
    [_logic, QGVAR(showVehicleCrewInfo),  "showVehicleCrewInfo"         ] call EFUNC(common,readSettingFromModule);
};

INFO("Nametags Module Initialized.");
