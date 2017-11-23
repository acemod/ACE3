/*
 * Author: Ruthberg
 *
 * Reads the ammo class config and updates the config cache
 *
 * Arguments:
 * ammo - classname <STRING>
 *
 * Return Value:
 * 0: _airFriction <NUMBER>
 * 1: _caliber <NUMBER>
 * 2: _bulletLength <NUMBER>
 * 3: _bulletMass <NUMBER>
 * 4: _transonicStabilityCoef <NUMBER>
 * 5: _dragModel <NUMBER>
 * 6: _ballisticCoefficients <NUMBER>
 * 7: _velocityBoundaries <NUMBER>
 * 8: _atmosphereModel <NUMBER>
 * 9: _ammoTempMuzzleVelocityShifts <NUMBER>
 * 10: _muzzleVelocityTable <NUMBER>
 * 11: _barrelLengthTable <NUMBER>
 *
 * Example:
 * ["ammo"] call ace_advanced_ballistics_fnc_readAmmoDataFromConfig
 *
 * Public: No
 */
#include "script_component.hpp"

TRACE_1("Reading Ammo Config",_this);

private _ammoConfig = configFile >> "CfgAmmo" >> _this;

private _airFriction = getNumber(_ammoConfig >> "airFriction");
private _caliber = 0 max getNumber(_ammoConfig >> "ACE_caliber");
private _bulletLength = 0 max getNumber(_ammoConfig >> "ACE_bulletLength");
private _bulletMass = 0 max getNumber(_ammoConfig >> "ACE_bulletMass");
private _transonicStabilityCoef = 0 max getNumber(_ammoConfig >> "ACE_transonicStabilityCoef") min 1;
if (_transonicStabilityCoef == 0) then {
    _transonicStabilityCoef = 0.5;
};
private _dragModel = getNumber(_ammoConfig >> "ACE_dragModel");
if (!(_dragModel in [1, 2, 5, 6, 7, 8])) then {
    _dragModel = 1;
};
private _ballisticCoefficients = getArray(_ammoConfig >> "ACE_ballisticCoefficients");
private _velocityBoundaries = getArray(_ammoConfig >> "ACE_velocityBoundaries");
private _atmosphereModel = getText(_ammoConfig >> "ACE_standardAtmosphere");
if (_atmosphereModel isEqualTo "") then {
    _atmosphereModel = "ICAO";
};
private _muzzleVelocityVariationSD = DEFAULT_MUZZLE_VELOCITY_VARIATION_SD;
if (isNumber (_ammoConfig >> "ACE_muzzleVelocityVariationSD")) then {
    _muzzleVelocityVariationSD = getNumber(_ammoConfig >> "ACE_muzzleVelocityVariationSD") / 100;
};
private _ammoTempMuzzleVelocityShifts = getArray(_ammoConfig >> "ACE_ammoTempMuzzleVelocityShifts");
private _muzzleVelocityTable = getArray(_ammoConfig >> "ACE_muzzleVelocities");
private _barrelLengthTable = getArray(_ammoConfig >> "ACE_barrelLengths");

//Handle subsonic ammo that would have a huge muzzle velocity shift (when ballistic configs not explicitly defined)
private _typicalSpeed = getNumber (_ammoConfig >> "typicalSpeed");
if ((_typicalSpeed > 0) && {_typicalSpeed < 360}) then {
    private _inheritedBarrelConfig = (!(_muzzleVelocityTable isEqualTo [])) && {(configProperties [_ammoConfig, "(configName _x) == 'ACE_muzzleVelocities'", false]) isEqualTo []};
    private _inheritedTempConfig = (!(_ammoTempMuzzleVelocityShifts isEqualTo [])) && {(configProperties [_ammoConfig, "(configName _x) == 'ACE_ammoTempMuzzleVelocityShifts'", false]) isEqualTo []};
    TRACE_3("subsonic",_typicalSpeed,_inheritedBarrelConfig,_inheritedTempConfig);
    if (_inheritedBarrelConfig || _inheritedTempConfig) then {
        private _parentConfig = inheritsFrom _ammoConfig;
        private _parentSpeed = getNumber (_parentConfig >> "typicalSpeed");
        WARNING_4("Subsonic Ammo %1 (%2 m/s) missing `ACE_muzzleVelocities` or `ACE_ammoTempMuzzleVelocityShifts` configs, attempting to use parent %3 (%4m/s)",_this,_typicalSpeed,configName _parentConfig, _parentSpeed);
        if (_parentSpeed <= 0) exitWith {//Handle weird or null parent
            _muzzleVelocityTable = [];
            _ammoTempMuzzleVelocityShifts = [];
        };
        private _linearMuliplier = _typicalSpeed / _parentSpeed;
        if (_inheritedBarrelConfig) then {
            if (!((configProperties [_parentConfig, "(configName _x) == 'ACE_muzzleVelocities'", false]) isEqualTo [])) then {
                TRACE_2("Parent Has Defined Barrel MV",_linearMuliplier,_muzzleVelocityTable);
                { _muzzleVelocityTable set [_forEachIndex, (_x * _linearMuliplier)]; } forEach _muzzleVelocityTable;
            } else {
                TRACE_2("Parent DOES NOT Have Defined Barrel MV",_linearMuliplier,_muzzleVelocityTable);
                _muzzleVelocityTable = [];
            };
        };
        if (_inheritedTempConfig) then {
            if (!((configProperties [_parentConfig, "(configName _x) == 'ACE_ammoTempMuzzleVelocityShifts'", false]) isEqualTo [])) then {
                TRACE_2("Parent Has Defined Ammo Temp Shifts",_linearMuliplier,_muzzleVelocityTable);
                { _ammoTempMuzzleVelocityShifts set [_forEachIndex, (_x * _linearMuliplier)]; } forEach _ammoTempMuzzleVelocityShifts;
            } else {
                TRACE_2("Parent DOES NOT Have Defined Ammo Temp Shifts",_linearMuliplier,_muzzleVelocityTable);
                _ammoTempMuzzleVelocityShifts = [];
            };
        };
    };
};

private _result = [_airFriction, _caliber, _bulletLength, _bulletMass, _transonicStabilityCoef, _dragModel, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _ammoTempMuzzleVelocityShifts, _muzzleVelocityTable, _barrelLengthTable, _muzzleVelocityVariationSD];

uiNamespace setVariable [format[QGVAR(%1), _this], _result];

_result
