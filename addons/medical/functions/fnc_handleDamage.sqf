/*
 * Author: KoffeinFlummi, Glowbal
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

private ["_unit", "_selection", "_damage", "_shooter", "_projectile", "_damageReturn", "_hitPoints",  "_typeOfDamage"];
_unit         = _this select 0;
_selection    = _this select 1;
_damage       = _this select 2;
_shooter      = _this select 3;
_projectile   = _this select 4;

if !(local _unit) exitWith {nil};

if (typeName _projectile == "OBJECT") then {
    _projectile = typeOf _projectile;
    _this set [4, _projectile];
};

// If the damage is being weird, we just tell it to fuck off.
_hitSelections = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
if !(_selection in (_hitSelections + [""])) exitWith {0};

_damageReturn = _damage;
if (GVAR(level) < 2) then {
    _damageReturn = _this call FUNC(handleDamage_basic);
};

if (GVAR(level) >= 2) then {
    if !([_unit] call FUNC(hasMedicalEnabled)) exitwith {
        // Because of the config changes, we cannot properly disable the medical system for a unit.
        // lets use basic for the time being..
        _damageReturn = _this call FUNC(handleDamage_basic);
    };

    [_unit, _selection, _damage, _source, _projectile] call FUNC(handleDamage_caching);

    if (_damageReturn > 0.9) then {

        _typeOfDamage = [_projectile] call FUNC(getTypeOfDamage);

        _typeIndex = (GVAR(allAvailableDamageTypes) find _typeOfDamage);
        _minLethalDamage = 0.01;
        if (_typeIndex >= 0) then {
            _minLethalDamage = GVAR(minLethalDamages) select _typeIndex;
        };

        _hitPoints = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
        _newDamage = _damage - (damage _unit);
        if (_selection in _hitSelections) then {
            _newDamage = _damage - (_unit getHitPointDamage (_hitPoints select (_hitSelections find _selection)));
        };

        if ((_minLethalDamage <= _newDamage) && {[_unit, [_selection] call FUNC(selectionNameToNumber), _newDamage] call FUNC(determineIfFatal)} && {_selection in ["", "head", "body"]}) then {
            if ([_unit] call FUNC(setDead)) then {
                _damageReturn = 1;
            } else {
                _damageReturn = 0.89;
            };
        } else {
            _damageReturn = 0.89;
        };
    };
};
[_unit] call FUNC(addToInjuredCollection);

if ((_unit getVariable [QGVAR(preventInstaDeath), GVAR(preventInstaDeath)]) && {_damageReturn >= 0.9} && {_selection in ["", "head", "body"]}) exitWith {
    if (vehicle _unit != _unit and {damage _vehicle >= 1}) then {
        // @todo
        // [_unit] call FUNC(unload);
    };
    [_unit] call FUNC(setDead);

    0.89
};

_damageReturn
