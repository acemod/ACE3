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

private["_activated", "_logic"];

_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, QGVAR(RequireSpecialist), "RequireSpecialist"]
    call EFUNC(Common,readSettingFromModule);
[_logic, QGVAR(PunishNonSpecialists),"PunishNonSpecialists"]
    call EFUNC(Common,readSettingFromModule);

diag_log text "[ACE]: Explosive Module Initialized.";
