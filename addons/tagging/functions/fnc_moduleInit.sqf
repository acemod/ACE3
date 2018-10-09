#include "script_component.hpp"
/*
 * Author: Jonpas
 * Initializes the Tagging module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_tagging_fnc_moduleInit
 *
 * Public: No
 */

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(quickTag), "quickTag"] call EFUNC(common,readSettingFromModule);

INFO("Tagging Module Initialized.");
