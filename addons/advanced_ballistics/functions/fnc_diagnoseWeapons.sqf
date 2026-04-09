#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * This function diagnoses all primary weapons to find cases in which the initial
 * velocity of shots with and without AB significantly mismatch.
 *
 * Arguments:
 * None
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
#endif

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";

private _filterFunction = toString {
    (getNumber (_x >> "type") in [TYPE_WEAPON_PRIMARY, TYPE_WEAPON_HANDGUN]) &&
    {configName _x == getText (_x >> "baseWeapon")} &&
    {if (isNumber (_x >> "scopeArsenal")) then {getNumber (_x >> "scopeArsenal") == 2 && {getNumber (_x >> "scope") > 0}} else {getNumber (_x >> "scope") == 2}}
};

{
    private _weaponConfig = _x;
    private _weapon = configName _weaponConfig;

    private _weaponInitSpeed = getNumber (_weaponConfig >> "initSpeed");
    private _magazines = getNumber (_weaponConfig >> "magazines");
    private _magazines = compatibleMagazines [_weapon, "this"];

    _magazines sort true;

    {
        private _magazine = _x;
        private _magazineConfig = _cfgMagazines >> _magazine;
        private _magazineInitSpeed = getNumber (_magazineConfig >> "initSpeed");
        private _ammo = getText (_magazineConfig >> "ammo");

        // AB initial speed --------------------------------
        // Get weapon and ammo configurations
        (_ammo call FUNC(readAmmoDataFromConfig)) params ["_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable", "_muzzleVelocityVariationSD"];
        (_weapon call FUNC(readWeaponDataFromConfig)) params ["_barrelTwist", "_twistDirection", "_barrelLength"];

        if (_barrelLength > 0) then {
            private _shiftedMV = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, 0] call FUNC(calculateBarrelLengthVelocityShift);

            if (_shiftedMV == 0) then {
                ERROR_2("%1:%2 has length set but invalid mags",_weapon,_magazine);
            };
        };

        // Vanilla initial speed --------------------------
        private _vanillaInitialSpeed = _magazineInitSpeed;

        if (_weaponInitSpeed > 0) then {
            _vanillaInitialSpeed = _weaponInitSpeed;
        } else {
            if (_weaponInitSpeed < 0) then {
                _vanillaInitialSpeed = _vanillaInitialSpeed * -_weaponInitSpeed;
            };
        };

        private _barrelVelocityShift = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, _vanillaInitialSpeed] call FUNC(calculateBarrelLengthVelocityShift);
        private _abInitialSpeed = _vanillaInitialSpeed + _barrelVelocityShift;

#ifdef DEBUG_INIT_SPEEDS
        _data pushBack [_abInitialSpeed, _magazine, _weapon];
#endif
        if (_barrelLength > 0 && abs (_vanillaInitialSpeed - _abInitialSpeed) > abs _abInitialSpeed * 0.0025) then {
            diag_log text format ["AB_Diagnose_initSpeed,%1,%2,%3,%4,%5,%6,%7,%8",_weapon,_magazine,_ammo,_magazineInitSpeed,_weaponInitSpeed,_vanillaInitialSpeed,_abInitialSpeed,_abInitialSpeed/_vanillaInitialSpeed];
        };

        if (_barrelTwist == 0) then {
            diag_log text format ["AB_Diagnose_barrelTwist,%1,%2,%3,%4,%5",_weapon,_magazine,_ammo,_twistDirection,_barrelTwist];
        };

        if (_barrelLength == 0) then {
            diag_log text format ["AB_Diagnose_barrelLength,%1,%2,%3,%4",_weapon,_magazine,_ammo,_barrelLength];
        };
    } forEach _magazines;
} forEach (_filterFunction configClasses _cfgWeapons);

#ifdef DEBUG_INIT_SPEEDS
    private _weapons = createHashMap;
    private _magazines = [];
    private _magazineInitSpeeds = [];

    reverse _data;

    {
        _x params ["_abInitialSpeed", "_magazine", "_weapon"];

        if !(_magazine in _magazines) then {
            private _magSpeed = _abInitialSpeed;
            private _ammoRef = getText (_cfgMagazines >> _magazine >> "ammo");

            if (_ammoRef != "") then {
                {
                    private _ammo = getText (_cfgMagazines >> _x >> "ammo");

                    if (_ammo == _ammoRef) exitWith {
                        _magSpeed = _magazineInitSpeeds select _forEachIndex;
                    };
                } forEach _magazines;
            };

            _magazines pushBack _magazine;
            _magazineInitSpeeds pushBack (round _magSpeed);
        };

        if !(_weapon in _weapons) then {
            private _magIndex = _magazines find _magazine;
            private _magSpeed = _magazineInitSpeeds select _magIndex;
            _weapons set [_weapon, _abInitialSpeed / _magSpeed];
        };
    } forEach _data;

    {
        diag_log text format ["AB_WeaponInitSpeed,%1,%2", _x, _y];
    } forEach _weapons;

    {
        diag_log text format ["AB_MagazineInitSpeed,%1,%2", _x, _magazineInitSpeeds select _forEachIndex];
    } forEach _magazines;
#endif

diag_log format ["AdvancedBallistics: Finished 'diagnoseWeapons' in %1 seconds", (diag_tickTime - _diagnoseStartTime) toFixed 2];
