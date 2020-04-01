#include "script_component.hpp"
/*
 * Author: Glowbal
 * Get the type of damage based upon the projectile.
 *
 * Arguments:
 * 0: The projectile classname or object <STRING>
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
    _damageType = switch (true) do {
        // non-projectiles reported by custom handleDamage wrapper
        case ((_typeOfProjectile select [0,1]) isEqualTo "#"): {
            _typeOfProjectile select [1]
        };
        // projectiles
        case (isText (configFile >> "CfgAmmo" >> _typeOfProjectile >> "ACE_damageType")): {
            getText (configFile >> "CfgAmmo" >> _typeOfProjectile >> "ACE_damageType")
        };
        default {
            WARNING_1("Damage Type [%1] has no ACE_damageType",_typeOfProjectile);
            toLower _typeOfProjectile
        };
    };

    GVAR(damageTypeCache) setVariable [_typeOfProjectile, _damageType];
};

_damageType // return
