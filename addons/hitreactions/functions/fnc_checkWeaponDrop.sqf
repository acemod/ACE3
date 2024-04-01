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

// Don't throw weapon if unit is unconscious
if !(_entity call EFUNC(common,isAwake)) exitWith {};

if ((currentWeapon _entity) in GVAR(undroppableWeapons)) exitWith {};

if !(random 1 < GVAR(weaponDropChanceArmHit) && {_selections findAny GVAR(armSelections) != -1}) exitWith {};

[QGVAR(dropWeapon), _entity, _entity] call CBA_fnc_targetEvent;
