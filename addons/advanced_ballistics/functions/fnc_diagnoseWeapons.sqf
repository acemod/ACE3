/*
 * Author: esteldunedain
 *
 * This function diagnoses all primary weapons to find cases in which the initial
 * velocity of shots with and without AB significantly mismatch
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_ballistics_fnc_diagnoseWeapons
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

private _cfgWeapons = configFile >> "CfgWeapons";
for "_i" from 0 to (count _cfgWeapons)-1 do {
    private _weaponConfig = _cfgWeapons select _i;
    if (isClass _weaponConfig) then {
        private _weapon = configName _weaponConfig;
        private _weaponType = getNumber (_weaponConfig >> "Type");
        if (_weaponType == 1) then {
            // The weapon is a primary weapon

            private _weaponInitSpeed = getNumber (_weaponConfig >> "initSpeed");
            private _magazines = getArray (_weaponConfig >> "magazines");
            {
                private _magazine = _x;
                private _magazineInitSpeed = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
                private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");

                // Vanilla initial speed --------------------------
                private _vanillaInitialSpeed = _magazineInitSpeed;
                if (_weaponInitSpeed > 0) then {
                    _vanillaInitialSpeed = _weaponInitSpeed;
                } else {
                    if (_weaponInitSpeed < 0) then {
                        _vanillaInitialSpeed = _vanillaInitialSpeed * (-_weaponInitSpeed);
                    };
                };
                // --------------------------------------------------

                // AB initial speed --------------------------------
                // Get Weapon and Ammo Configurations
                private _AmmoCacheEntry = _ammo call FUNC(readAmmoDataFromConfig);
                private _WeaponCacheEntry = _weapon call FUNC(readWeaponDataFromConfig);
                _AmmoCacheEntry params ["_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable"];
                _WeaponCacheEntry params ["_barrelTwist", "_twistDirection", "_barrelLength"];

                private _barrelVelocityShift = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, _vanillaInitialSpeed] call FUNC(calculateBarrelLengthVelocityShift);
                private _abInitialSpeed = _vanillaInitialSpeed + _barrelVelocityShift;
                // --------------------------------------------------
                diag_log text format ["ABDiagnose,%1,%2,%3,%4,%5,%6,%7",_weapon,_magazine,_ammo,_magazineInitSpeed,_weaponInitSpeed,_vanillaInitialSpeed,_abInitialSpeed];
            } forEach _magazines;
        };
    };
};
