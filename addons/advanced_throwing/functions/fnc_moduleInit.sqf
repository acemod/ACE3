/*
 * Author: Jonpas
 * Initializes the Advanced Throwing module.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Synchronized Units <ARRAY>
 * 2: Module Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic, [unit1, unit2], true] call ace_advanced_throwing_fnc_moduleInit
 *
 * Public: No
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(enabled), "enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showThrowArc), "showThrowArc"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showMouseControls), "showMouseControls"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enablePickUp), "enablePickUp"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(enablePickUpAttached), "enablePickUpAttached"] call EFUNC(common,readSettingFromModule);

INFO_1("Advanced Throwing Module Initialized. Enabled: %1",GVAR(enabled));
