/*
 * Author: Ruthberg
 *
 * Reads the ammo class config and updates the config cache
 *
 * Arguments:
 * 0: ammo - classname <string>
 *
 * Return Value:
 * 0: [_airFriction, _caliber, _bulletLength, _bulletMass, _transonicStabilityCoef, _dragModel, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _ammoTempMuzzleVelocityShifts, _muzzleVelocityTable, _barrelLengthTable] <ARRAY>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

private ["_ammo", "_airFriction", "_caliber", "_bulletLength", "_bulletMass", "_transonicStabilityCoef", "_dragModel", "_ballisticCoefficients", "_velocityBoundaries", "_atmosphereModel", "_ammoTempMuzzleVelocityShifts", "_muzzleVelocityTable", "_barrelLengthTable", "_result"];
_ammo = _this;

_airFriction = getNumber(configFile >> "CfgAmmo" >> _ammo >> "airFriction");
_caliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_caliber");
_bulletLength = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_bulletLength");
_bulletMass = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_bulletMass");
_transonicStabilityCoef = 0.5;
if (isNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_transonicStabilityCoef")) then {
    _transonicStabilityCoef = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_transonicStabilityCoef");
};
_dragModel = 1;
_ballisticCoefficients = [];
_velocityBoundaries = [];
_atmosphereModel = "ICAO";
if (isNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_dragModel")) then {
    _dragModel = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_dragModel");
    if (!(_dragModel in [1, 2, 5, 6, 7, 8])) then {
        _dragModel = 1;
    };
};
if (isArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_ballisticCoefficients")) then {
    _ballisticCoefficients = getArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_ballisticCoefficients");
};
if (isArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_velocityBoundaries")) then {
    _velocityBoundaries = getArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_velocityBoundaries");
};
if (isText(configFile >> "CfgAmmo" >> _ammo >> "ACE_standardAtmosphere")) then {
    _atmosphereModel = getText(configFile >> "CfgAmmo" >> _ammo >> "ACE_standardAtmosphere");
};
_ammoTempMuzzleVelocityShifts = [];
if (isArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_ammoTempMuzzleVelocityShifts")) then {
    _ammoTempMuzzleVelocityShifts = getArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_ammoTempMuzzleVelocityShifts");
};
_muzzleVelocityTable = [];
_barrelLengthTable = [];
if (isArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_muzzleVelocities")) then {
    _muzzleVelocityTable = getArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_muzzleVelocities");
};
if (isArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_barrelLengths")) then {
    _barrelLengthTable = getArray(configFile >> "CfgAmmo" >> _ammo >> "ACE_barrelLengths");
};

_result = [_airFriction, _caliber, _bulletLength, _bulletMass, _transonicStabilityCoef, _dragModel, _ballisticCoefficients, _velocityBoundaries, _atmosphereModel, _ammoTempMuzzleVelocityShifts, _muzzleVelocityTable, _barrelLengthTable];

uiNamespace setVariable [format[QGVAR(%1), _ammo], _result];

_result
