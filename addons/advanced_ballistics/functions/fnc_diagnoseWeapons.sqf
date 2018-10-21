#define DEBUG_MODE_FULL
#include "script_component.hpp"
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

private _diagnoseStartTime = diag_tickTime;
#ifdef DEBUG_INIT_SPEEDS
    private _data = [];
    private _weapons = [];
    private _magazines = [];
    private _weaponInitSpeeds = [];
    private _magazineInitSpeeds = [];
#endif

private _cfgWeapons = configFile >> "CfgWeapons";
for "_i" from 0 to (count _cfgWeapons)-1 do {
    private _weaponConfig = _cfgWeapons select _i;
    if (isClass _weaponConfig) then {
        private _weapon = configName _weaponConfig;
        private _weaponType = getNumber (_weaponConfig >> "Type");
        if (_weaponType in [TYPE_WEAPON_PRIMARY, TYPE_WEAPON_HANDGUN]) then {
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
                private _AmmoCacheEntry = uiNamespace getVariable format[QGVAR(%1), _ammo];
                if (isNil "_AmmoCacheEntry") then {
                     _AmmoCacheEntry = _ammo call FUNC(readAmmoDataFromConfig);
                };
                private _WeaponCacheEntry = uiNamespace getVariable format[QGVAR(%1), _weapon];
                if (isNil "_WeaponCacheEntry") then {
                     _WeaponCacheEntry = _weapon call FUNC(readWeaponDataFromConfig);
                };
                _AmmoCacheEntry params ["_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable", "_muzzleVelocityVariationSD"];
                _WeaponCacheEntry params ["_barrelTwist", "_twistDirection", "_barrelLength"];

                private _barrelVelocityShift = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, _vanillaInitialSpeed] call FUNC(calculateBarrelLengthVelocityShift);
                private _abInitialSpeed = _vanillaInitialSpeed + _barrelVelocityShift;
                // --------------------------------------------------
                
                if (_weapon find "_base" == -1 && _weapon find "_Base" == -1) then {
#ifdef DEBUG_INIT_SPEEDS
                    _data pushBack [-_forEachIndex, _abInitialSpeed, _magazine, _weapon];
#endif
                    if (_barrelLength > 0 && abs(_vanillaInitialSpeed - _abInitialSpeed) > abs(_abInitialSpeed) * 0.0025) then {
                        diag_log text format ["AB_Diagnose_initSpeed,%1,%2,%3,%4,%5,%6,%7,%8",_weapon,_magazine,_ammo,_magazineInitSpeed,_weaponInitSpeed,_vanillaInitialSpeed,_abInitialSpeed,_abInitialSpeed/_vanillaInitialSpeed];
                    };
                    if (_barrelTwist == 0) then {
                        diag_log text format ["AB_Diagnose_barrelTwist,%1,%2,%3,%4,%5",_weapon,_magazine,_ammo,_twistDirection,_barrelTwist];
                    };
                    if (_barrelLength == 0) then {
                        diag_log text format ["AB_Diagnose_barrelLength,%1,%2,%3,%4,%5",_weapon,_magazine,_ammo,_barrelLength];
                    };
                };
            } forEach _magazines;
        };
    };
};

#ifdef DEBUG_INIT_SPEEDS
    _data sort false;
    {
        _x params ["_magazineIndex", "_abInitialSpeed", "_magazine", "_weapon"];
        if (_magazines find _magazine == -1) then {
            private _magSpeed = _abInitialSpeed;
            private _ammoRef = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
            if (_ammoRef != "") then {
                {
                    private _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
                    if (_ammo == _ammoRef) exitWith {
                        _magSpeed = _magazineInitSpeeds select _forEachIndex;
                    };
                } forEach _magazines;
            };
            _magazines pushBack _magazine;
            _magazineInitSpeeds pushBack round(_magSpeed);
        };
        if (_weapons find _weapon == -1) then {
            _weapons pushBack _weapon;
            _magIndex = _magazines find _magazine;
            _magSpeed = _magazineInitSpeeds select _magIndex;
            _weaponInitSpeeds pushBack (_abInitialSpeed / _magSpeed);
        };
    } forEach _data;
    {
        _x params ["_magazineIndex", "_abInitialSpeed", "_magazine", "_weapon"];
        _magIndex = _magazines find _magazine;
        _magSpeed = _magazineInitSpeeds select _magIndex;
        _wepIndex = _weapons find _weapon;
        _wepSpeed = _weaponInitSpeeds select _wepIndex;
    } forEach _data;
    {
        diag_log text format ["AB_WeaponInitSpeed,%1,%2", _x, _weaponInitSpeeds select _forEachIndex];
    } forEach _weapons;
    {
        diag_log text format ["AB_MagazineInitSpeed,%1,%2", _x, _magazineInitSpeeds select _forEachIndex];
    } forEach _magazines;
#endif

diag_log format["AdvancedBallistics: Finished 'diagnoseWeapons' in %1 seconds", (diag_tickTime - _diagnoseStartTime) toFixed 2];
