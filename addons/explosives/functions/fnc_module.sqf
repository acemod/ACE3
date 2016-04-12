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

if !(isServer) exitWith {};

params ["_logic"];

[_logic, QGVAR(RequireSpecialist), "RequireSpecialist"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(PunishNonSpecialists),"PunishNonSpecialists"] call CFUNC(readSettingFromModule);
[_logic, QGVAR(ExplodeOnDefuse),"ExplodeOnDefuse"] call CFUNC(readSettingFromModule);

ACE_LOGINFO("Explosive Module Initialized.");
