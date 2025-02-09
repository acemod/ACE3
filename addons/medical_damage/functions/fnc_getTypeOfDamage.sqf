#include "..\script_component.hpp"
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
 * "bullet" call ace_medical_damage_fnc_getTypeOfDamage
 *
 * Public: No
 */

params ["_typeOfProjectile"];

GVAR(damageTypeCache) getOrDefaultCall [_typeOfProjectile, {
    private _projectileConfig = configFile >> "CfgAmmo" >> _typeOfProjectile >> "ACE_damageType";
    private _damageType = ""; // needs to be higher scope because switch

    switch (false) do {
        case (isText _projectileConfig): { // no property or wrong type
            WARNING_1("Ammo type [%1] has no ACE_damageType",_typeOfProjectile);
            "unknown" // return
        };

        _damageType = getText _projectileConfig;
        case (_damageType in GVAR(damageTypeDetails)): { // config may define an invalid damage type
            WARNING_2("Damage type [%1] for ammo [%2] not found",_damageType,_typeOfProjectile);
            "unknown" // return
        };
        default {
            _damageType // return
        };
    };
}, true]
