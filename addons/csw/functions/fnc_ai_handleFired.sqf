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

params ["_staticWeapon", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
TRACE_8("firedEH:",_staticWeapon,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_gunner);

if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};
if (someAmmo _staticWeapon) exitWith {};

TRACE_2("need ammo",someAmmo _staticWeapon,magazinesAllTurrets _staticWeapon);

[_staticWeapon, _gunner, _weapon, _magazine] call FUNC(ai_reload);
