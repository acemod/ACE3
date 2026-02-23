#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Calculates the zero angle correction for the new zero range based on current zero range and bore height (distance between bore- and sight axis).
 *
 * Arguments:
 * 0: Old Zero range <NUMBER>
 * 1: New Zero range <NUMBER>
 * 2: Bore height - cm <NUMBER>
 * 3: Weapon <STRING>
 * 4: Muzzle <STRING>
 * 5: Ammo <STRING>
 * 6: Magazine <STRING>
 * 7: Advanced Ballistics enabled? <BOOL>
 *
 * Return Value:
 * Zero angle correction <NUMBER>
 *
 * Example:
 * [5, 6, 3.81, "arifle_MXM_F", "B_65x39_Caseless", "30Rnd_65x39_caseless_mag", true] call ace_scopes_fnc_calculateZeroAngleCorrection
 *
 * Public: No
 */

params ["_oldZeroRange", "_newZeroRange", "_boreHeight", "_weapon", "_muzzle", "_ammo", "_magazine", "_advancedBallistics"];

// When FFV from vehicles currentZeroing will report 0 so just bail
if (_oldZeroRange <= 0) exitWith { 0 };

GVAR(zeroAngleCorrectionData) getOrDefaultCall [_this, {
    private _airFriction = getNumber (configFile >> "CfgAmmo" >> _ammo >> "airFriction");
    private _initSpeed = 0;
    private _initSpeedCoef = getNumber (configFile >> "CfgWeapons" >> _weapon >> "initSpeed");

    if (_initSpeedCoef > 0) then {
        _initSpeed = _initSpeedCoef;
    } else {
        _initSpeed = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");

        if (_initSpeedCoef < 0) then {
            _initSpeed = _initSpeed * -_initSpeedCoef;
        };
    };

    private _vanillaZero = parseNumber (("ace" callExtension ["ballistics:replicate_vanilla_zero", [_oldZeroRange, _initSpeed, _airFriction]]) select 0);

    #ifdef DISABLE_DISPERSION
        _vanillaZero = 0;
    #endif

    private _trueZero = if (_advancedBallistics) then {
        // Get Weapon and Ammo Configurations
        (_ammo call EFUNC(advanced_ballistics,readAmmoDataFromConfig)) params ["_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable", "_muzzleVelocityVariationSD"];
        ([_weapon, _muzzle] call EFUNC(advanced_ballistics,readWeaponDataFromConfig)) params ["_barrelTwist", "_twistDirection", "_barrelLength"];

        if (missionNamespace getVariable [QEGVAR(advanced_ballistics,barrelLengthInfluenceEnabled), false]) then {
            private _barrelVelocityShift = [_barrelLength, _muzzleVelocityTable, _barrelLengthTable, _initSpeed] call EFUNC(advanced_ballistics,calculateBarrelLengthVelocityShift);
            _initSpeed = _initSpeed + _barrelVelocityShift;
        };

        if (missionNamespace getVariable [QEGVAR(advanced_ballistics,ammoTemperatureEnabled), false]) then {
            private _ammoTemperatureVelocityShift = ([_ammoTempMuzzleVelocityShifts, GVAR(zeroReferenceTemperature)] call EFUNC(advanced_ballistics,calculateAmmoTemperatureVelocityShift));
            _initSpeed = _initSpeed + _ammoTemperatureVelocityShift;
        };

        parseNumber (
            ("ace" callExtension ["ballistics:zero_advanced", [
                _newZeroRange,
                _initSpeed,
                _boreHeight,
                GVAR(zeroReferenceTemperature),
                GVAR(zeroReferenceBarometricPressure),
                GVAR(zeroReferenceHumidity),
                _ballisticCoefficients select 0,
                _dragModel,
                _atmosphereModel
            ]]) select 0
        )
    } else {
        parseNumber (("ace" callExtension ["ballistics:zero_vanilla", [_newZeroRange, _initSpeed, _airFriction, _boreHeight]]) select 0)
    };

    private _zeroAngleCorrection = _trueZero - _vanillaZero;

    TRACE_8("Zero correction",_oldZeroRange,_newZeroRange,_boreHeight,_weapon,_ammo,_magazine,_advancedBallistics,_zeroAngleCorrection);

    _zeroAngleCorrection
}, true] // return
