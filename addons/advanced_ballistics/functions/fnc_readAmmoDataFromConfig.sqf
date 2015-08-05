/*
 * Author: Ruthberg
 *
 * Reads the ammo class config and updates the config cache
 *
 * Arguments:
 * ammo - classname <STRING>
 *
 * Return Value:
 * 0: _airFriction
 * 1: _caliber
 * 2: _bulletLength
 * 3: _bulletMass
 * 4: _transonicStabilityCoef
 * 5: _dragModel
 * 6: _ballisticCoefficients
 * 7: _velocityBoundaries
 * 8: _atmosphereModel
 * 9: _ammoTempMuzzleVelocityShifts
 * 10: _muzzleVelocityTable
 * 11: _barrelLengthTable
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_ammo", "_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable", "_result"];
_ammoConfig = configFile >> "CfgAmmo" >> _this;

_airFriction = getNumber(_ammoConfig >> "airFriction");
_caliber = getNumber(_ammoConfig >> "ACE_caliber");
_bulletLength = getNumber(_ammoConfig >> "ACE_bulletLength");
_bulletMass = getNumber(_ammoConfig >> "ACE_bulletMass");
_transonicStabilityCoef = getNumber(_ammoConfig >> "ACE_transonicStabilityCoef");
if (_transonicStabilityCoef == 0) then {
    _transonicStabilityCoef = 0.5;
};
_dragModel = getNumber(_ammoConfig >> "ACE_dragModel");
if (_dragModel == 0 || !(_dragModel in [1, 2, 5, 6, 7, 8])) then {
    _dragModel = 1;
};
_ballisticCoefficients = getArray(_ammoConfig >> "ACE_ballisticCoefficients");
_velocityBoundaries = getArray(_ammoConfig >> "ACE_velocityBoundaries");
_atmosphereModel = getText(_ammoConfig >> "ACE_standardAtmosphere");
if (_atmosphereModel isEqualTo "") then {
    _atmosphereModel = "ICAO";
};
_ammoTempMuzzleVelocityShifts = getArray(_ammoConfig >> "ACE_ammoTempMuzzleVelocityShifts");
_muzzleVelocityTable = getArray(_ammoConfig >> "ACE_muzzleVelocities");
_barrelLengthTable = getArray(_ammoConfig >> "ACE_barrelLengths");

_result = [_airFriction, _caliber, _bulletLength, _bulletMass, _transonicStabilityCoef, _dragModel, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _ammoTempMuzzleVelocityShifts, _muzzleVelocityTable, _barrelLengthTable];

uiNamespace setVariable [format[QGVAR(%1), _this], _result];

_result
