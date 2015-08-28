/*
 * Author: Ruthberg
 * Parses all input fields in the gun, atmosphere and target column and the result input fields
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_parse_input
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_inclinationAngleCosine", "_inclinationAngleDegree", "_boreHeight", "_bulletMass",
         "_bulletDiameter", "_airFriction", "_rifleTwist", "_muzzleVelocity", "_zeroRange"];

GVAR(altitude) = -1000 max parseNumber(ctrlText 130030) min 20000;
GVAR(temperature) = -50 max parseNumber(ctrlText 130040) min 160;
GVAR(barometricPressure) = 10 max parseNumber(ctrlText 130050) min 1350;
GVAR(relativeHumidity) = (0 max parseNumber(ctrlText 130060) min 100) / 100;
if (GVAR(currentUnit) != 2) then {
    GVAR(altitude) = GVAR(altitude) * 0.3048;
    GVAR(temperature) = (GVAR(temperature) - 32) / 1.8;
    GVAR(barometricPressure) = GVAR(barometricPressure) * 33.86389;
};


GVAR(latitude) set [GVAR(currentTarget), -90 max Round(parseNumber(ctrlText 140000)) min 90];
GVAR(directionOfFire) set [GVAR(currentTarget), 0 max abs(Round(parseNumber(ctrlText 140010))) min 359];
GVAR(windSpeed1) set [GVAR(currentTarget), 0 max abs(parseNumber(ctrlText 140020)) min 50];
GVAR(windSpeed2) set [GVAR(currentTarget), 0 max abs(parseNumber(ctrlText 140021)) min 50];
GVAR(windDirection) set [GVAR(currentTarget), 1 max Round(parseNumber(ctrlText 140030)) min 12];
_inclinationAngleCosine = 0.5 max parseNumber(ctrlText 140041) min 1;
_inclinationAngleDegree = -60 max round(parseNumber(ctrlText 140040)) min 60;
if (_inclinationAngleDegree != GVAR(inclinationAngle) select GVAR(currentTarget)) then {
    GVAR(inclinationAngle) set [GVAR(currentTarget), _inclinationAngleDegree];
} else {
    if (_inclinationAngleCosine != Round(cos(GVAR(inclinationAngle) select GVAR(currentTarget)) * 100) / 100) then {
        GVAR(inclinationAngle) set [GVAR(currentTarget), round(acos(_inclinationAngleCosine))];
    };
};
GVAR(targetSpeed) set [GVAR(currentTarget), 0 max abs(parseNumber(ctrlText 140050)) min 50];
if ((ctrlText 140051) == ">") then {
    GVAR(targetSpeedDirection) set [GVAR(currentTarget), +1];
} else {
    GVAR(targetSpeedDirection) set [GVAR(currentTarget), -1];
};
GVAR(targetRange) set [GVAR(currentTarget), 0 max abs(parseNumber(ctrlText 140060)) min 4000];
if (GVAR(currentUnit) != 2) then {
    GVAR(windSpeed1) set [GVAR(currentTarget), (GVAR(windSpeed1) select GVAR(currentTarget)) * 0.44704];
    GVAR(windSpeed2) set [GVAR(currentTarget), (GVAR(windSpeed2) select GVAR(currentTarget))  * 0.44704];
    GVAR(targetSpeed) set [GVAR(currentTarget), (GVAR(targetSpeed) select GVAR(currentTarget))  * 0.44704];
};
if (GVAR(currentUnit) == 1) then {
    GVAR(targetRange) set [GVAR(currentTarget), (GVAR(targetRange) select GVAR(currentTarget))  * 0.9144];
};

_boreHeight = parseNumber(ctrlText 120000);
_bulletMass = parseNumber(ctrlText 120010);
_bulletDiameter = parseNumber(ctrlText 120020) * 10;
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    _airFriction = 0.1 max parseNumber(ctrlText 120030) min 2;
} else {
    _airFriction = parseNumber(ctrlText 120030) / -1000;
};
_rifleTwist = parseNumber(ctrlText 120040);
_muzzleVelocity = parseNumber(ctrlText 120050);
_zeroRange = parseNumber (ctrlText 120060);
if (GVAR(currentUnit) != 2) then {
    _boreHeight = _boreHeight * 2.54;
    _bulletMass = _bulletMass * 0.06479891;
    _bulletDiameter = _bulletDiameter * 2.54;
    _rifleTwist = _rifleTwist * 2.54;
    _muzzleVelocity = _muzzleVelocity / 3.2808399;
};
if (GVAR(currentUnit) == 1) then {
    _zeroRange = _zeroRange / 1.0936133;
};
_boreHeight = 0.1 max _boreHeight min 10;
_bulletMass = 1 max _bulletMass min 100;
_bulletDiameter = 1 max _bulletDiameter min 25;
_muzzleVelocity = 100 max _muzzleVelocity min 1400;
_zeroRange = 0 max _zeroRange min 1000;
GVAR(workingMemory) set [5, _boreHeight];
GVAR(workingMemory) set [12, _bulletMass];
GVAR(workingMemory) set [13, _bulletDiameter];
GVAR(workingMemory) set [14, _rifleTwist];
if (missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) then {
    GVAR(workingMemory) set [15, _airFriction];
} else {
    GVAR(workingMemory) set [4, _airFriction];
};
GVAR(workingMemory) set [1, _muzzleVelocity];
GVAR(workingMemory) set [2, _zeroRange];

[] call FUNC(update_gun);
[] call FUNC(update_gun_ammo_data);
[] call FUNC(update_atmosphere);
[] call FUNC(update_atmo_env_data);
[] call FUNC(update_target);
[] call FUNC(update_target_data);

[] call FUNC(store_user_data);
