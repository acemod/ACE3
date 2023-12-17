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

params ["_vehicle", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
TRACE_8("firedEH:",_vehicle,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_gunner);

if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};
if (someAmmo _vehicle) exitWith {};

TRACE_2("need ammo",someAmmo _vehicle,magazinesAllTurrets _vehicle);

[_vehicle, _gunner] call FUNC(ai_reload);
