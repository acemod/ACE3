#include "..\script_component.hpp"
/*
 * Author: KJW
 * Checks if an entity should drop their weapon based on projectile hit info.
 *
 * Arguments:
 * 0: Entity that was hit <OBJECT>
 * 1: Selection names that were hit <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, []] call ace_hitreactions_fnc_checkWeaponDrop
 *
 * Public: No
 */

params ["_entity", "_selections"];

// Make sure entity is a unit
if !(_entity isKindOf "CAManBase") exitWith {};

// Don't throw weapon if unit is unconscious or dead
if !(lifeState _entity in ["HEALTHY", "INJURED"]) exitWith {};

if (random 1 >= ([GVAR(weaponDropChanceArmHitAI), GVAR(weaponDropChanceArmHitPlayer)] select (_entity call EFUNC(common,isPlayer)))) exitWith {};

if (_selections findAny GVAR(armSelections) == -1) exitWith {};

if (getNumber ((currentWeapon _entity) call CBA_fnc_getItemConfig >> QGVAR(undroppable)) == 1) exitWith {};

[QGVAR(dropWeapon), _entity, _entity] call CBA_fnc_targetEvent;
