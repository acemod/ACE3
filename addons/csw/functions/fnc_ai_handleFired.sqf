#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles AI Fired EH.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Weapon (not used) <STRING>
 * 2: Muzzle (not used) <STRING>
 * 3: Mode (not used) <STRING>
 * 4: Ammo (not used) <STRING>
 * 5: Magazine (not used) <STRING>
 * 6: Projectile (not used) <OBJECT>
 * 7: Gunner <OBJECT>
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
if ((!local _gunner) || {_gunner call EFUNC(common,isPlayer)}) exitWith {};

TRACE_1("need ammo",magazinesAllTurrets _vehicle);

[_vehicle, _gunner] call FUNC(ai_reload);
