/*
 * Author: Glowbal
 * Advanced HandleDamage EH function.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter <OBJECT>
 * 4: Projectile <STRING>
 * 5: Current damage to be returned <NUMBER>
 * 6: Type of Damage <STRING>
 *
 * Return Value:
 * Damage To Be Inflicted <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_unit","_selectionName","_amountOfDamage","_sourceOfDamage","_typeOfProjectile","_typeOfDamage"];
_unit = _this select 0;
_selectionName = _this select 1;
_amountOfDamage = _this select 2;
_sourceOfDamage = _this select 3;
_typeOfProjectile = _this select 4;
_returnDamage = _this select 5;
_typeOfDamage = [_typeOfProjectile] call FUNC(getTypeOfDamage);


// TODO parse for new damage
// TODO parse for kill injuries

[_unit, _selectionName, _amountOfDamage, _typeOfProjectile, _typeOfDamage] call FUNC(handleDamage_wounds);

if (GVAR(enableAirway)) then {
    [_unit,_selectionName,_amountOfDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_airway);
};
if (GVAR(enableFractures)) then {
    [_unit,_selectionName,_amountOfDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_fractures);
};
if (GVAR(enableInternalBleeding)) then {
    [_unit,_selectionName,_amountOfDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_internalInjuries);
};

if (alive _unit && {!(_unit getvariable ["ACE_isUnconscious", false])}) then {
	[_unit, _amountOfDamage] call FUNC(reactionToDamage);
};

_returnDamage;
