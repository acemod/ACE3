#include "..\script_component.hpp"
/*
 * Author: Glowbal, Ruthberg
 * Module for adjusting the wind deflection settings
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_winddeflection_fnc_initModuleSettings
 *
 * Public: No
 */

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(enabled), "enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(vehicleEnabled), "vehicleEnabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(simulationInterval), "simulationInterval"] call EFUNC(common,readSettingFromModule);

GVAR(simulationInterval) = 0 max GVAR(simulationInterval) min 0.2;
