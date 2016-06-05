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
 * [logic, [unit1, unit2], true] call ace_advancedthrowing_fnc_moduleInit
 *
 * Public:
 * No
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(enabled), "Enabled"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showThrowArc), "ShowThrowArc"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(showMouseControls), "ShowMouseControls"] call EFUNC(common,readSettingFromModule);

ACE_LOGINFO_1("Advanced Throwing Module Initialized. Enabled: %1",GVAR(enabled));
