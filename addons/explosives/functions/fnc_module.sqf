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
#include "script_component.hpp"

params ["_logic"];

[_logic, QGVAR(RequireSpecialist), "RequireSpecialist"] call EFUNC(Common,readSettingFromModule);
[_logic, QGVAR(PunishNonSpecialists),"PunishNonSpecialists"] call EFUNC(Common,readSettingFromModule);
[_logic, QGVAR(ExplodeOnDefuse),"ExplodeOnDefuse"] call EFUNC(Common,readSettingFromModule);

INFO("Explosive Module Initialized.");
