/*
 * Author: KoffeinFlummi
 * Main HandleDamage EH function.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter <OBJECT>
 * 4: Projectile <OBJECT/STRING>
 *
 * Return Value:
 * Damage To Be Inflicted <NUMBER>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_unit", "_selectionName", "_damage", "_source", "_projectile", "_damageReturn"];

_unit =          _this select 0;
_selectionName = _this select 1;
_damage =        _this select 2;
_source =        _this select 3;
_projectile =    _this select 4;

if !(local _unit) exitWith {nil};

if (typeName _projectile == "OBJECT") then {
    _projectile = typeOf _projectile;
};


_damageReturn = _damage;

if (ace_medical_level >= 0) then {
    _damageReturn = (_this + _damageReturn) call ace_medical_fnc_handleDamage_basic;
};

if (ace_medical_level >= 1) then {
    _damageReturn = (_this + _damageReturn) call ace_medical_fnc_handleDamage_medium;
};

if (ace_medical_level >= 2) then {
    _damageReturn = (_this + _damageReturn) call ace_medical_fnc_handleDamage_advanced;
};

_damageReturn
