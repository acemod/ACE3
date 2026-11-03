#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Initializes the Sitting module.
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QXGVAR(enable), "enable"] call EFUNC(common,readSettingFromModule);

INFO("Sitting Module Initialized.");
