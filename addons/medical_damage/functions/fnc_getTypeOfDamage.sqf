#include "script_component.hpp"
/*
 * Author: Glowbal
 * Get the type of damage based upon the projectile.
 *
 * Arguments:
 * 0: The projectile classname OR the name of a damage type <STRING>
 *
 * Return Value:
 * Type of damage <STRING>
 *
 * Example:
 * ["bullet"] call ace_medical_damage_fnc_getTypeOfDamage
 *
 * Public: No
 */

params ["_typeOfProjectile"];

private _damageType = GVAR(damageTypeCache) getVariable _typeOfProjectile;

if (isNil "_damageType") then {
    if (isText (configFile >> "CfgAmmo" >> _typeOfProjectile >> "ACE_damageType")) then {
        _damageType = getText (configFile >> "CfgAmmo" >> _typeOfProjectile >> "ACE_damageType");
    } else {
        WARNING_1("Ammo type [%1] has no ACE_damageType",_typeOfProjectile);
        _damageType = "unknown";
    };

    // config may define an invalid damage type
    if (isNil {GVAR(allDamageTypesData) getVariable _damageType}) then {
        WARNING_2("Damage type [%1] for ammo [%2] not found",_typeOfDamage,_typeOfProjectile);
        _damageType = "unknown";
    };

    TRACE_2("getTypeOfDamage caching",_typeOfProjectile,_damageType);
    GVAR(damageTypeCache) setVariable [_typeOfProjectile, _damageType];
};

_damageType // return
