/*
 * Author: esteldunedain
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

params ["_logic", "", "_activated"];

if !(_activated) exitWith {};

GVAR(Module) = true;

[_logic, QGVAR(playerNamesViewDistance),  "playerNamesViewDistance"     ] call CFUNC(readSettingFromModule);
[_logic, QGVAR(showCursorTagForVehicles), "showCursorTagForVehicles"    ] call CFUNC(readSettingFromModule);

// Do Not Force - read module setting only non-default is set due to using SCALAR
if ((_logic getVariable "showPlayerNames") != -1) then {
    [_logic, QGVAR(showPlayerNames),      "showPlayerNames"             ] call CFUNC(readSettingFromModule);
};
if ((_logic getVariable "showNamesForAI") != -1) then {
    [_logic, QGVAR(showNamesForAI),      "showNamesForAI"             ] call CFUNC(readSettingFromModule);
};
if ((_logic getVariable "showVehicleCrewInfo") != -1) then {
    [_logic, QGVAR(showVehicleCrewInfo),  "showVehicleCrewInfo"         ] call CFUNC(readSettingFromModule);
};

ACE_LOGINFO("Nametags Module Initialized.");
