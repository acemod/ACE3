#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles AI Fired EH
 *
 * Arguments:
 * Fired EH
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_vehicle", "_weapon", "", "", "", "_magazine", "", "_gunner"];
TRACE_4("firedEH:",_vehicle,_weapon,_magazine,_gunner);

if (someAmmo _vehicle) exitWith {};
if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};

TRACE_1("need ammo",magazinesAllTurrets _vehicle);

[_vehicle, _gunner, _weapon, _magazine] call FUNC(ai_reload);
