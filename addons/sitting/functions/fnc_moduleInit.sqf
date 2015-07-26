/*
 * Author: Jonpas
 * Initializes the Sitting module.
 *
 * Arguments:
 * Whatever the module provides.
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

if !(isServer) exitWith {};

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

[_logic, QGVAR(enable), "enable"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: Sitting Module Initialized.";
