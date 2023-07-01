#include "script_component.hpp"
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
params ["_staticWeapon", "_role", "_gunner", "_turret"];
TRACE_3("getInEH:",_staticWeapon,_role,_gunner);

if ((!local _gunner) || {[_gunner] call EFUNC(common,isPlayer)}) exitWith {};
if (someAmmo _staticWeapon) exitWith {};

// turret can be empty when AI is forcefully moved to the vehicle
if (_turret isEqualTo []) then {
    _turret = (assignedVehicleRole _gunner) select 1;
};

// this doesn't handle multi-weapon turrets, need a "turretWeapon" event or a PFH to do that
private _weapon = (_staticWeapon weaponsTurret _turret) select 0;
TRACE_4("need ammo",someAmmo _staticWeapon,magazinesAllTurrets _staticWeapon,_turret,_weapon);

[_staticWeapon, _gunner, _weapon] call FUNC(ai_reload);
