#include "..\script_component.hpp"
/*
 * Author: Ruthberg
 * Parses all input fields in the gun-, atmosphere- and target column, the result input fields and the muzzle velocity data input fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_parse_input
 *
 * Public: No
 */

// Muzzle velocity vs. temperature interpolation data
{
    private _temperature = parseNumber(ctrlText _x);
    if (GVAR(currentUnit) != 2) then {
        _temperature = -50 max _temperature min 160;
        _temperature = (_temperature - 32) / 1.8;
    } else {
        _temperature = -50 max _temperature min 71;
    };
    ((GVAR(workingMemory) select 18) select _forEachIndex) set [0, _temperature];
} forEach [160021, 160022, 160023, 160024, 160025, 160026, 160027];
{
    private _muzzleVelocity = abs(parseNumber(ctrlText _x));
    if (_muzzleVelocity > 0) then {
        if (GVAR(currentUnit) != 2) then {
            _muzzleVelocity = 300 max _muzzleVelocity min 4500;
            _muzzleVelocity = _muzzleVelocity * 0.3048;
        } else {
            _muzzleVelocity = 100 max _muzzleVelocity min 1400;
        };
    };
    ((GVAR(workingMemory) select 18) select _forEachIndex) set [1, _muzzleVelocity];
} forEach [160031, 160032, 160033, 160034, 160035, 160036, 160037];

// C1 coefficient vs. distance interpolation data
{
    private _distance = abs(parseNumber(ctrlText _x));
    if (_distance > 0) then {
        if (GVAR(currentUnit) == 1) then {
            _distance = 25 max _distance min 4000;
            _distance = _distance * 0.9144;
        } else {
            _distance = 25 max _distance min 3700;
        };
    };
    ((GVAR(workingMemory) select 19) select _forEachIndex) set [0, _distance];
} forEach [170021, 170022, 170023, 170024, 170025, 170026, 170027];
{
    private _c1 = abs(parseNumber(ctrlText _x));
    if (_c1 > 0) then {
        _c1 = 0.1 max _c1 min 2.0;
    };
    ((GVAR(workingMemory) select 19) select _forEachIndex) set [1, _c1];
} forEach [170031, 170032, 170033, 170034, 170035, 170036, 170037];

GVAR(altitude) = parseNumber(ctrlText 130030);
GVAR(temperature) = parseNumber(ctrlText 130040);
GVAR(barometricPressure) = parseNumber(ctrlText 130050);
GVAR(relativeHumidity) = parseNumber(ctrlText 130060) / 100;
if (GVAR(currentUnit) != 2) then {
    GVAR(altitude) = -1000 max GVAR(altitude) min 20000;
    GVAR(temperature) = -50 max GVAR(temperature) min 160;
    GVAR(barometricPressure) = 10 max GVAR(barometricPressure) min 40;
    GVAR(altitude) = GVAR(altitude) * 0.3048;
    GVAR(temperature) = (GVAR(temperature) - 32) / 1.8;
    GVAR(barometricPressure) = GVAR(barometricPressure) * 33.86389;
} else {
    GVAR(altitude) = -300 max GVAR(altitude) min 6100;
    GVAR(temperature) = -50 max GVAR(temperature) min 71;
    GVAR(barometricPressure) = 340 max GVAR(barometricPressure) min 1350;
};

private _windSpeed1 = parseNumber(ctrlText 140020);
private _windSpeed2 = parseNumber(ctrlText 140021);
private _targetSpeed = parseNumber(ctrlText 140050);
private _targetRange = parseNumber(ctrlText 140060);
if (GVAR(currentUnit) != 2) then {
    _windSpeed1 = 0 max _windSpeed1 min 50;
    _windSpeed2 = 0 max _windSpeed2 min 50;
    _targetSpeed = 0 max _targetSpeed min 50;
    _windSpeed1 = _windSpeed1 * 0.44704;
    _windSpeed2 = _windSpeed2 * 0.44704;
    _targetSpeed = _targetSpeed * 0.44704;
} else {
    _windSpeed1 = 0 max _windSpeed1 min 25;
    _windSpeed2 = 0 max _windSpeed2 min 25;
    _targetSpeed = 0 max _targetSpeed min 25;
};
if (GVAR(currentUnit) == 1) then {
    _targetRange = 25 max _targetRange min 4000;
    _targetRange = _targetRange * 0.9144;
} else {
    _targetRange = 25 max _targetRange min 3700;
};
GVAR(targetRangeDirtyFlag) = GVAR(targetRangeDirtyFlag) || {_targetRange != GVAR(targetRange) select GVAR(currentTarget)};
GVAR(latitude) set [GVAR(currentTarget), -90 max round(parseNumber(ctrlText 140000)) min 90];
GVAR(directionOfFire) set [GVAR(currentTarget), 0 max abs(round(parseNumber(ctrlText 140010))) min 359];
GVAR(windSpeed1) set [GVAR(currentTarget), _windSpeed1];
GVAR(windSpeed2) set [GVAR(currentTarget), _windSpeed2];
GVAR(windDirection) set [GVAR(currentTarget), 1 max round(parseNumber(ctrlText 140030)) min 12];
GVAR(targetSpeed) set [GVAR(currentTarget), _targetSpeed];
GVAR(targetRange) set [GVAR(currentTarget), _targetRange];
private _inclinationAngleCosine = 0.5 max parseNumber(ctrlText 140041) min 1;
private _inclinationAngleDegree = -60 max round(parseNumber(ctrlText 140040)) min 60;
if (_inclinationAngleDegree != GVAR(inclinationAngle) select GVAR(currentTarget)) then {
    GVAR(inclinationAngle) set [GVAR(currentTarget), _inclinationAngleDegree];
} else {
    if (_inclinationAngleCosine != round(cos(GVAR(inclinationAngle) select GVAR(currentTarget)) * 100) / 100) then {
        GVAR(inclinationAngle) set [GVAR(currentTarget), round(acos(_inclinationAngleCosine))];
    };
};
if ((ctrlText 140051) == ">") then {
    GVAR(targetSpeedDirection) set [GVAR(currentTarget), +1];
} else {
    GVAR(targetSpeedDirection) set [GVAR(currentTarget), -1];
};

private _boreHeight = parseNumber(ctrlText 120000);
private _bulletMass = parseNumber(ctrlText 120010);
private _bulletDiameter = parseNumber(ctrlText 120020);
private _airFriction = parseNumber(ctrlText 120030);
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    _airFriction = 0.1 max _airFriction min 2;
} else {
    _airFriction = _airFriction / -1000;
};
private _rifleTwist = parseNumber(ctrlText 120040);
private _muzzleVelocity = parseNumber(ctrlText 120050);
private _zeroRange = parseNumber(ctrlText 120060);
if (GVAR(currentUnit) != 2) then {
    _boreHeight = 0.1 max _boreHeight min 5;
    _bulletMass = 1 max _bulletMass min 1500;
    _bulletDiameter = 0.1 max _bulletDiameter min 1.0;
    _rifleTwist = 1 max _rifleTwist min 36;
    _muzzleVelocity = 300 max _muzzleVelocity min 4500;
    _boreHeight = _boreHeight * 2.54;
    _bulletMass = _bulletMass * 0.06479891;
    _bulletDiameter = _bulletDiameter * 2.54;
    _rifleTwist = _rifleTwist * 2.54;
    _muzzleVelocity = _muzzleVelocity * 0.3048;
} else {
    _boreHeight = 0.1 max _boreHeight min 10;
    _bulletMass = 1 max _bulletMass min 100;
    _bulletDiameter = 0.1 max _bulletDiameter min 2.5;
    _rifleTwist = 1 max _rifleTwist min 75;
    _muzzleVelocity = 100 max _muzzleVelocity min 1400;
};
_zeroRange = 25 max _zeroRange min 1000;
if (GVAR(currentUnit) == 1) then {
    _zeroRange = _zeroRange * 0.9144;
};
GVAR(workingMemory) set [5, _boreHeight];
GVAR(workingMemory) set [12, _bulletMass];
GVAR(workingMemory) set [13, _bulletDiameter * 10];
GVAR(workingMemory) set [14, _rifleTwist];
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    if (_airFriction != GVAR(workingMemory) select 15) then {
        (_airFriction - (GVAR(workingMemory) select 15)) call FUNC(shift_c1_ballistic_coefficient_data);
    };
    GVAR(workingMemory) set [15, _airFriction];
} else {
    GVAR(workingMemory) set [4, _airFriction];
};
if (_muzzleVelocity != GVAR(workingMemory) select 1) then {
    (_muzzleVelocity - (GVAR(workingMemory) select 1)) call FUNC(shift_muzzle_velocity_data);
};
GVAR(workingMemory) set [1, _muzzleVelocity];
GVAR(workingMemory) set [2, _zeroRange];

if (GVAR(targetRangeDirtyFlag) && missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    [false, false] call FUNC(recalculate_c1_ballistic_coefficient);
    GVAR(targetRangeDirtyFlag) = false;
};

[] call FUNC(update_gun);
[] call FUNC(update_gun_ammo_data);
[] call FUNC(update_atmosphere);
[] call FUNC(update_atmo_env_data);
[] call FUNC(update_target);
[] call FUNC(update_target_data);
[] call FUNC(update_muzzle_velocity_data);
[] call FUNC(update_c1_ballistic_coefficient_data);

[] call FUNC(store_user_data);
