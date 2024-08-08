#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles AI Fired EH.
 *
 * Arguments:
 * Fired EH
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_vehicle", "", "", "", "", "", "", "_gunner"];
TRACE_1("firedEH:",_this);

if (someAmmo _vehicle) exitWith {};
if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};

TRACE_2("need ammo",someAmmo _vehicle,magazinesAllTurrets _vehicle);

[_vehicle, _gunner] call FUNC(ai_reload);
