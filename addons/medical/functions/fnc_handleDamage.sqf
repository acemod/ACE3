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

private ["_unit", "_selection", "_damage", "_shooter", "_projectile", "_damageReturn",  "_typeOfDamage"];
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
if !(_selection in (GVAR(SELECTIONS) + [""])) exitWith {0};

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
    _newDamage = _this call FUNC(handleDamage_caching);

    if (_damageReturn > 0.9) then {

        _typeOfDamage = [_projectile] call FUNC(getTypeOfDamage);

        _typeIndex = (GVAR(allAvailableDamageTypes) find _typeOfDamage);
        _minLethalDamage = 0.01;
        if (_typeIndex >= 0) then {
            _minLethalDamage = GVAR(minLethalDamages) select _typeIndex;
        };

        if (vehicle _unit != _unit && {!(vehicle _unit isKindOf "StaticWeapon")} && {isNull _source} && {_projectile == ""} && {_selection == ""}) then {
            if (GVAR(enableVehicleCrashes)) then {
                _selection = GVAR(SELECTIONS) select (floor(random(count GVAR(SELECTIONS))));
            };
        };

        if ([_unit, [_selection] call FUNC(selectionNameToNumber), _newDamage] call FUNC(determineIfFatal)) then {
            if ([_unit] call FUNC(setDead)) then {
                _damageReturn = 1;
            } else {
                _damageReturn = _damageReturn min 0.89;
            };
        } else {
            _damageReturn = _damageReturn min 0.89;
        };
    };
};
[_unit] call FUNC(addToInjuredCollection);

if (((_unit getVariable [QGVAR(enableRevive), GVAR(enableRevive)])) && {_damageReturn >= 0.9} && {_selection in ["", "head", "body"]}) exitWith {
    if (vehicle _unit != _unit and {damage _vehicle >= 1}) then {
        // @todo
        // [_unit] call FUNC(unload);
    };
    [_unit] call FUNC(setDead);

    0.89
};

_damageReturn
