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

if (GVAR(ammoHandling) != 2) exitWith {};

params ["_vehicle", "", "", "", "", "", "", "_gunner"];
TRACE_2("firedEH:",_vehicle,_gunner);

if (someAmmo _vehicle) exitWith {};
if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};

TRACE_1("need ammo",magazinesAllTurrets _vehicle);

[_vehicle, _gunner] call FUNC(ai_reload);
