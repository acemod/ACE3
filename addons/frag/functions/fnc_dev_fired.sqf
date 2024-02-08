#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Add fired rounds to dev track.
 *
 * Arguments:
 * Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_frag_fnc_fired
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_vehicle,_gunner,_turret);

[_projectile, true, [side group _unit, side group ACE_player] call BIS_fnc_sideIsFriendly] call FUNC(dev_addRound);
