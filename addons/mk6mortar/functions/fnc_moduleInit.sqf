#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Loads settings from the module.
 *
 * Arguments:
 * 0: The Module Logic Object <OBJECT>
 * 1: synced objects <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [fromModule] call ace_mk6mortar_fnc_moduleInit
 *
 * Public: No
 */

params ["_logic", "_syncedUnits", "_activated"];

if (!_activated) exitWith {WARNING("Module - placed but not active");};

[_logic, QGVAR(airResistanceEnabled), "airResistanceEnabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(allowComputerRangefinder), "allowComputerRangefinder"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(allowCompass), "allowCompass"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(useAmmoHandling), "useAmmoHandling"] call EFUNC(common,readSettingFromModule);
