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

<<<<<<< HEAD
private ["_unit", "_selection", "_damage", "_shooter", "_projectile", "_damageReturn", "_hitPoints"];
=======
private ["_damageReturn", "_typeOfDamage"];
>>>>>>> 596d018f45d34ae8f713efcd3c0c3c2e3156af07

_unit         = _this select 0;
_selection    = _this select 1;
_damage       = _this select 2;
_shooter      = _this select 3;
_projectile   = _this select 4;

diag_log _this;

if !(local _unit) exitWith {nil};

if (typeName _projectile == "OBJECT") then {
    _projectile = typeOf _projectile;
    _this set [4, _projectile];
};

<<<<<<< HEAD
// If the damage is being weird, we just tell it to fuck off.
_hitSelections = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
if !(_selection in (_hitSelections + [""])) exitWith {0};

_damageReturn = _damage;

// @todo, remove once parameters are set up
if (isNil QGVAR(level)) then {
  GVAR(level) = 0;
};

=======
_damageReturn = (_this select 2);
_typeOfDamage = [_this select 4] call FUNC(getTypeOfDamage)
>>>>>>> 596d018f45d34ae8f713efcd3c0c3c2e3156af07
if (GVAR(level) >= 0) then {
    _damageReturn = (_this + [_damageReturn, _typeOfDamage]) call FUNC(handleDamage_basic);
};
if (GVAR(level) >= 1) then {
<<<<<<< HEAD
    _damageReturn = (_this + [_damageReturn]) call FUNC(handleDamage_medium);
};
if (GVAR(level) >= 2) then {
    _damageReturn = (_this + [_damageReturn]) call FUNC(handleDamage_advanced);
};

if (_damageReturn < 0.01) exitWith {0};
=======
    _damageReturn = (_this + [_damageReturn, _typeOfDamage]) call FUNC(handleDamage_medium);

    if (GVAR(level) >= 2) then {
	    _damageReturn = (_this + [_damageReturn, _typeOfDamage]) call FUNC(handleDamage_advanced);
	};
};
>>>>>>> 596d018f45d34ae8f713efcd3c0c3c2e3156af07
_damageReturn
