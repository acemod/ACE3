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

private ["_damageReturn"];

if !(local (_this select 0)) exitWith {nil};

if (typeName (_this select 4) == "OBJECT") then {
    _this set [4, typeOf (_this select 4)];
};


_damageReturn = (_this select 2);

if (GVAR(level) >= 0) then {
    _damageReturn = (_this + [_damageReturn]) call FUNC(handleDamage_basic);
};

if (GVAR(level) >= 1) then {
    _damageReturn = (_this + [_damageReturn]) call FUNC(handleDamage_medium);
};

if (GVAR(level) >= 2) then {
    _damageReturn = (_this + [_damageReturn]) call FUNC(handleDamage_advanced);
};

_damageReturn
