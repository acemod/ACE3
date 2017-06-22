/*
 * Author: Ruthberg
 * Updates the scope base angle based on the zero range input
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_update_zero_range
 *
 * Public: No
 */
#include "script_component.hpp"

[] call FUNC(parse_input);

private ["_bulletMass", "_boreHeight", "_airFriction", "_muzzleVelocity", "_bc", "_dragModel", "_atmosphereModel"];
_bulletMass = GVAR(workingMemory) select 12;
_boreHeight = GVAR(workingMemory) select 5;
_airFriction = GVAR(workingMemory) select 4;
_muzzleVelocity = GVAR(workingMemory) select 1;
_bc = GVAR(workingMemory) select 15;
_dragModel = GVAR(workingMemory) select 16;
_atmosphereModel = GVAR(workingMemory) select 17;

private ["_zeroRange"];
_zeroRange = GVAR(workingMemory) select 2;

private ["_altitude", "_temperature", "_barometricPressure", "_relativeHumidity"];
_altitude = GVAR(altitude);
_temperature = GVAR(temperature);
_barometricPressure = GVAR(barometricPressure);
_relativeHumidity = GVAR(relativeHumidity);
if (!GVAR(atmosphereModeTBH)) then {
    _barometricPressure = 1013.25 * (1 - (0.0065 * _altitude) / (273.15 + _temperature + 0.0065 * _altitude)) ^ 5.255754495;
    _relativeHumidity = 50;
};

private _scopeBaseAngle = if (!(missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false])) then {
    private _zeroAngle = "ace_advanced_ballistics" callExtension format ["zeroAngleVanilla:%1:%2:%3:%4", _zeroRange, _muzzleVelocity, _airFriction, _boreHeight];
    (parseNumber _zeroAngle)
} else {
    private _zeroAngle = "ace_advanced_ballistics" callExtension format ["zeroAngle:%1:%2:%3:%4:%5:%6:%7:%8:%9", _zeroRange, _muzzleVelocity, _boreHeight, _temperature, _barometricPressure, _relativeHumidity, _bc, _dragModel, _atmosphereModel];
    (parseNumber _zeroAngle)
};

GVAR(workingMemory) set [2, _zeroRange];
GVAR(workingMemory) set [3, _scopeBaseAngle];
