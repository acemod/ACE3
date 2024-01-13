#include "..\script_component.hpp"
/*
 * Author: Grim
 * Handles AI GetIn on an empty weapon
 *
 * Arguments:
 * GetIn EH
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_staticWeapon", "_role", "_gunner"];
TRACE_3("getInEH:",_staticWeapon,_role,_gunner);

if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};
if (someAmmo _staticWeapon) exitWith {};

TRACE_2("need ammo",someAmmo _staticWeapon,magazinesAllTurrets _staticWeapon);

[_staticWeapon, _gunner, currentWeapon _staticWeapon] call FUNC(ai_reload);
