/*
 * Author: Glowbal
 * Damage orchestration
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter <OBJECT>
 * 4: Projectile <STRING>
 * 5: Hit part index of the hit point <NUMBER>
 * 6: Current damage to be returned <NUMBER>
 *
 * //On 1.63 dev:
 * 6: Shooter? <OBJECT>
 * 7: Current damage to be returned <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_selectionName", "_amountOfDamage", "_sourceOfDamage", "_typeOfProjectile", "_hitPointNumber", "_newDamage"];

//Temp fix for 1.63 handleDamage changes
if (_newDamage isEqualType objNull) then {
    _newDamage = _this select 7;
};
TRACE_5("ACE_DEBUG: damageOrchestration Called",_unit, _selectionName, _amountOfDamage, _sourceOfDamage, _typeOfProjectile);

private _part = [_selectionName] call EFUNC(medical,selectionNameToNumber);
if (_part < 0) exitWith {};

private _hitPoints = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
// Sorting out the damage
private _damageBodyParts = _unit getVariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0]];

_damageBodyParts set [_part, (_damageBodyParts select _part) + _newDamage];
_unit setVariable [QEGVAR(medical,bodyPartStatus), _damageBodyParts, true];

private _typeOfDamage = [_typeOfProjectile] call FUNC(getTypeOfDamage);

[_unit, _selectionName, _newDamage, _typeOfProjectile, _typeOfDamage] call FUNC(woundsHandler); // TODO also support the sqf variant

// TODO Disabled until implemented fully
//if (GVAR(enableAirway)) then {
//    [_unit,_selectionName,_newDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_airway);
//};
//if (GVAR(enableFractures)) then {
//    [_unit,_selectionName,_newDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_fractures);
//};
//if (GVAR(enableInternalBleeding)) then {
//    [_unit,_selectionName,_newDamage,_sourceOfDamage, _typeOfDamage] call FUNC(handleDamage_internalInjuries);
//};

// TODO raise state events for unit
