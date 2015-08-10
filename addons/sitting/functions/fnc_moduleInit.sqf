/*
 * Author: Jonpas
 * Initializes the Sitting module.
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if !(isServer) exitWith {};

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(enable), "enable"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: Sitting Module Initialized.";
