#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Initializes the module settings.
 *
 * Arguments:
 * 0: Module <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MODULE] call ace_advanced_fatigue_fnc_moduleSettings
 *
 * Public: No
 */
params ["_logic"];

[_logic, QGVAR(enabled), "Enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(performanceFactor), "PerformanceFactor"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(recoveryFactor), "RecoveryFactor"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(loadFactor), "LoadFactor"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(terrainGradientFactor), "TerrainGradientFactor"] call EFUNC(common,readSettingFromModule);
