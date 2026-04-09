#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Reads the ammo class config and caches it.
 *
 * Arguments:
 * 0: Ammo <STRING>
 *
 * Return Value:
 * 0: Air friction coefficient <NUMBER>
 * 1: Caliber <NUMBER>
 * 2: Bullet length <NUMBER>
 * 3: Bullet mass <NUMBER>
 * 4: Transonic stability coefficient <NUMBER>
 * 5: Drag model <NUMBER>
 * 6: Ballistics coefficients <ARRAY of NUMBERs>
 * 7: Velocity boundaries <ARRAY of NUMBERs>
 * 8: Atmospheric model <NUMBER>
 * 9: Ammo tempature muzzle velocity shifts <ARRAY of NUMBERs>
 * 10: Muzzle velocity array <ARRAY of NUMBERs>
 * 11: Barrel Length array <ARRAY of NUMBERs>
 * 12: Muzzle velocity standard deviation <NUMBER>
 *
 * Example:
 * "B_556x45_Ball" call ace_advanced_ballistics_fnc_readAmmoDataFromConfig
 *
 * Public: No
 */

params ["_ammo"];

GVAR(ammoData) getOrDefaultCall [_ammo, {
    TRACE_1("Reading Ammo Config",_ammo);

    private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
    private _airFriction = getNumber (_ammoConfig >> "airFriction");
    private _caliber = 0 max getNumber (_ammoConfig >> "ACE_caliber");
    private _bulletLength = 0 max getNumber (_ammoConfig >> "ACE_bulletLength");
    private _bulletMass = 0 max getNumber (_ammoConfig >> "ACE_bulletMass");
    private _transonicStabilityCoef = 0 max getNumber (_ammoConfig >> "ACE_transonicStabilityCoef") min 1;

    if (_transonicStabilityCoef == 0) then {
        _transonicStabilityCoef = 0.5;
    };

    private _dragModel = getNumber (_ammoConfig >> "ACE_dragModel");

    if !(_dragModel in [1, 2, 5, 6, 7, 8]) then {
        _dragModel = 1;
    };

    private _ballisticCoefficients = getArray (_ammoConfig >> "ACE_ballisticCoefficients");

    if (_ballisticCoefficients isEqualTo []) then {
        _ballisticCoefficients = [0.5];
    };

    private _velocityBoundaries = getArray (_ammoConfig >> "ACE_velocityBoundaries");
    private _atmosphereModel = getText (_ammoConfig >> "ACE_standardAtmosphere");

    if (_atmosphereModel == "") then {
        _atmosphereModel = "ICAO";
    };

    private _muzzleVelocityVariationSD = DEFAULT_MUZZLE_VELOCITY_VARIATION_SD;

    if (isNumber (_ammoConfig >> "ACE_muzzleVelocityVariationSD")) then {
        _muzzleVelocityVariationSD = getNumber (_ammoConfig >> "ACE_muzzleVelocityVariationSD") / 100;
    };

    private _ammoTempMuzzleVelocityShifts = getArray (_ammoConfig >> "ACE_ammoTempMuzzleVelocityShifts");
    private _muzzleVelocityTable = getArray (_ammoConfig >> "ACE_muzzleVelocities");
    private _barrelLengthTable = getArray (_ammoConfig >> "ACE_barrelLengths");

    // Handle subsonic ammo that would have a huge muzzle velocity shift (when ballistic configs not explicitly defined)
    private _typicalSpeed = getNumber (_ammoConfig >> "typicalSpeed");

    if ((_typicalSpeed > 0) && {_typicalSpeed < 360}) then {
        private _parentConfig = inheritsFrom _ammoConfig;
        private _inheritedBarrelConfig = (_muzzleVelocityTable isNotEqualTo []) && {(_parentConfig >> "ACE_muzzleVelocities") == (_ammoConfig >> "ACE_muzzleVelocities")};
        private _inheritedTempConfig = (_ammoTempMuzzleVelocityShifts isNotEqualTo []) && {(_parentConfig >> "ACE_ammoTempMuzzleVelocityShifts") == (_ammoConfig >> "ACE_ammoTempMuzzleVelocityShifts")};
        TRACE_3("subsonic",_typicalSpeed,_inheritedBarrelConfig,_inheritedTempConfig);

        if (_inheritedBarrelConfig || _inheritedTempConfig) then {
            private _parentSpeed = getNumber (_parentConfig >> "typicalSpeed");
            WARNING_4("Subsonic Ammo %1 (%2 m/s) missing `ACE_muzzleVelocities` or `ACE_ammoTempMuzzleVelocityShifts` configs, attempting to use parent %3 (%4m/s)",_ammo,_typicalSpeed,configName _parentConfig,_parentSpeed);

            if (_parentSpeed <= 0) exitWith { // Handle weird or null parent
                _muzzleVelocityTable = [];
                _ammoTempMuzzleVelocityShifts = [];
            };

            private _grandparentConfig = inheritsFrom _parentConfig;
            private _linearMuliplier = _typicalSpeed / _parentSpeed;

            if (_inheritedBarrelConfig) then {
                _muzzleVelocityTable = if ((_grandparentConfig >> "ACE_muzzleVelocities") != (_parentConfig >> "ACE_muzzleVelocities")) then {
                    TRACE_2("Parent Has Defined Barrel MV",_linearMuliplier,_muzzleVelocityTable);
                    _muzzleVelocityTable vectorMultiply _linearMuliplier
                } else {
                    TRACE_2("Parent DOES NOT Have Defined Barrel MV",_linearMuliplier,_muzzleVelocityTable);
                    []
                };
            };

            if (_inheritedTempConfig) then {
                _ammoTempMuzzleVelocityShifts = if ((_grandparentConfig >> "ACE_ammoTempMuzzleVelocityShifts") != (_parentConfig >> "ACE_ammoTempMuzzleVelocityShifts")) then {
                    TRACE_2("Parent Has Defined Ammo Temp Shifts",_linearMuliplier,_muzzleVelocityTable);
                    _ammoTempMuzzleVelocityShifts vectorMultiply _linearMuliplier
                } else {
                    TRACE_2("Parent DOES NOT Have Defined Ammo Temp Shifts",_linearMuliplier,_muzzleVelocityTable);
                    []
                };
            };
        };
    };

    [_airFriction, _caliber, _bulletLength, _bulletMass, _transonicStabilityCoef, _dragModel, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _ammoTempMuzzleVelocityShifts, _muzzleVelocityTable, _barrelLengthTable, _muzzleVelocityVariationSD]
}, true] // return
