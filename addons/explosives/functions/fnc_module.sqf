#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Initialises the explosives module
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Synchronized Units (not used) <ARRAY>
 * 2: Module Activated (not used) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * Called By BIS.
 *
 * Public: No
 */

params ["_logic"];

[_logic, QGVAR(requireSpecialist), "RequireSpecialist"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(punishNonSpecialists), "PunishNonSpecialists"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(explodeOnDefuse), "ExplodeOnDefuse"] call EFUNC(common,readSettingFromModule);

INFO("Explosive Module Initialized.");
