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

params ["_vehicle", "", "_gunner"];
TRACE_2("getInEH:",_vehicle,_gunner);

if (someAmmo _vehicle) exitWith {};
if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};

TRACE_1("need ammo",magazinesAllTurrets _vehicle);

[_vehicle, _gunner, currentWeapon _vehicle] call FUNC(ai_reload);
