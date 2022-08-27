#include "script_component.hpp"
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

[] call FUNC(parse_input);

private _bulletMass = GVAR(workingMemory) select 12;
private _boreHeight = GVAR(workingMemory) select 5;
private _airFriction = GVAR(workingMemory) select 4;
private _muzzleVelocity = GVAR(workingMemory) select 1;
private _bc = GVAR(workingMemory) select 15;
private _dragModel = GVAR(workingMemory) select 16;
private _atmosphereModel = GVAR(workingMemory) select 17;
private _zeroRange = GVAR(workingMemory) select 2;
private _altitude = GVAR(altitude);
private _temperature = GVAR(temperature);
private _barometricPressure = GVAR(barometricPressure);
private _relativeHumidity = GVAR(relativeHumidity);

if (!GVAR(atmosphereModeTBH)) then {
    _barometricPressure = 1013.25 * (1 - (0.0065 * _altitude) / (273.15 + _temperature + 0.0065 * _altitude)) ^ 5.255754495;
    _relativeHumidity = 0.5;
};

private _scopeBaseAngle = if (!(missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false])) then {
    parseNumber (("ace" callExtension ["ballistics:zero_vanilla", [
        _zeroRange,
        _muzzleVelocity,
        _airFriction,
        _boreHeight
    ]]) select 0)
} else {
    parseNumber (("ace" callExtension ["ballistics:zero_advanced", [
        _zeroRange,
        _muzzleVelocity,
        _airFriction,
        _boreHeight,
        _temperature,
        _barometricPressure,
        _relativeHumidity,
        _bc,
        _dragModel,
        _atmosphereModel
    ]]) select 0)
};

GVAR(workingMemory) set [2, _zeroRange];
GVAR(workingMemory) set [3, _scopeBaseAngle];
