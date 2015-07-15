/*
 * Author: Jonpas
 * Initializes the UI module.
 *
 * Arguments:
 * 0: Module Logic <LOGIC>
 * 1: Units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

if !(isServer) exitWith {};

PARAMS_3(_logic,_units,_activated);

if !(_activated) exitWith {};

[_logic, QGVAR(weaponInfo), "weaponInfo"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(weaponName), "weaponName"] call EFUNC(common,readSettingFromModule);
//[_logic, QGVAR(ammoCount), "ammoCount"] call EFUNC(common,readSettingFromModule); // Disabled in config by ace_reload
[_logic, QGVAR(magCount), "magCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(grenadeName), "grenadeName"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(grenadeCount), "grenadeCount"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(zeroing), "zeroing"] call EFUNC(common,readSettingFromModule);

diag_log text "[ACE]: UI Module Initialized.";
