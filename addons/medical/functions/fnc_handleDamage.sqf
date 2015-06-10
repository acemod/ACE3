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

private ["_unit", "_selection", "_damage", "_shooter", "_projectile", "_damageReturn",  "_typeOfDamage", "_minLethalDamage", "_newDamage", "_typeIndex", "_preventDeath"];
_unit       = _this select 0;
_selection  = _this select 1;
_damage     = _this select 2;
_shooter    = _this select 3;
_projectile = _this select 4;

if !(local _unit) exitWith {nil};

if (typeName _projectile == "OBJECT") then {
    _projectile = typeOf _projectile;
    _this set [4, _projectile];
};

// If the damage is being weird, we just tell it to fuck off.
if !(_selection in (GVAR(SELECTIONS) + [""])) exitWith {0};

// Exit if we disable damage temporarily
_damageOld = damage _unit;
if (_selection in GVAR(SELECTIONS)) then {
    _damageOld = _unit getHit _selection;
};
if !(_unit getVariable [QGVAR(allowDamage), true]) exitWith {_damageOld};

// Get return damage
_damageReturn = _damage;
if (GVAR(level) < 2) then {
    _damageReturn = _this call FUNC(handleDamage_basic);
} else {
    if !([_unit] call FUNC(hasMedicalEnabled)) exitwith {
        // Because of the config changes, we cannot properly disable the medical system for a unit.
        // lets use basic for the ACE_time being..
        _damageReturn = _this call FUNC(handleDamage_basic);
    };
    _newDamage = _this call FUNC(handleDamage_caching);
    _typeOfDamage = [_projectile] call FUNC(getTypeOfDamage);
    systemChat _typeOfDamage;
    
    _typeIndex = (GVAR(allAvailableDamageTypes) find _typeOfDamage);
    _minLethalDamage = 0.01;
    if (_typeIndex >= 0) then {
        _minLethalDamage = GVAR(minLethalDamages) select _typeIndex;
    };

    if (vehicle _unit != _unit && {!(vehicle _unit isKindOf "StaticWeapon")} && {isNull _shooter} && {_projectile == ""} && {_selection == ""}) then {
        if (GVAR(enableVehicleCrashes)) then {
            _selection = GVAR(SELECTIONS) select (floor(random(count GVAR(SELECTIONS))));
        };
    };

    if ((_minLethalDamage <= _newDamage) && {[_unit, [_selection] call FUNC(selectionNameToNumber), _newDamage] call FUNC(determineIfFatal)}) then {
        if ((_unit getVariable [QGVAR(preventInstaDeath), GVAR(preventInstaDeath)])) exitwith {
            _damageReturn = 0.9;
        };
        if ([_unit] call FUNC(setDead)) then {
            _damageReturn = 1;
        } else {
            _damageReturn = _damageReturn min 0.89;
        };
    } else {
        _damageReturn = _damageReturn min 0.89;
    };
};
[_unit] call FUNC(addToInjuredCollection);


if (_unit getVariable [QGVAR(preventInstaDeath), GVAR(preventInstaDeath)]) exitWith {
    if (vehicle _unit != _unit and {damage (vehicle _unit) >= 1}) then {
        [_unit] call EFUNC(common,unloadPerson);
    };

    private "_delayedUnconsicous";
    _delayedUnconsicous = false;
    if (vehicle _unit != _unit and {damage (vehicle _unit) >= 1}) then {
        [_unit] call EFUNC(common,unloadPerson);
        _delayedUnconsicous = true;
    };

    if (_damageReturn >= 0.9 && {_selection in ["", "head", "body"]}) exitWith {
        if (_unit getvariable ["ACE_isUnconscious", false]) exitwith {
            [_unit] call FUNC(setDead);
            0.89
        };
        if (_delayedUnconsicous) then {
            [{
                [_this select 0, true] call FUNC(setUnconscious);
            }, [_unit], 0.7, 0] call EFUNC(common,waitAndExec);
        } else {
            [{
                [_this select 0, true] call FUNC(setUnconscious);
            }, [_unit]] call EFUNC(common,execNextFrame);
        };
        0.89
    };
    _damageReturn min 0.89;
};

if (((_unit getVariable [QGVAR(enableRevive), GVAR(enableRevive)]) > 0) && {_damageReturn >= 0.9} && {_selection in ["", "head", "body"]}) exitWith {
    if (vehicle _unit != _unit and {damage (vehicle _unit) >= 1}) then {
        [_unit] call EFUNC(common,unloadPerson);
    };
    [_unit] call FUNC(setDead);

    0.89
};

_damageReturn
