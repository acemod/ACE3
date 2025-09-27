#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Initialises the explosives module
 *
 * Arguments:
 * Module things.
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
