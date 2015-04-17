/*
 * Author: Ruthberg
 * Parses all input fields in the gun, atmosphere and target column and the result input fields
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_parse_input
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(temperature) = parseNumber(ctrlText 200);
GVAR(barometricPressure) = 0 max parseNumber(ctrlText 210);
GVAR(relativeHumidity) = (0 max parseNumber(ctrlText 220) min 100) / 100;

GVAR(windSpeed) set [GVAR(currentTarget), 0 max abs(parseNumber(ctrlText 300)) min 50];
GVAR(windDirection) set [GVAR(currentTarget), 1 max Round(parseNumber(ctrlText 310)) min 12];
GVAR(inclinationAngle) set [GVAR(currentTarget), -60 max parseNumber(ctrlText 320) min 60];
GVAR(targetSpeed) set [GVAR(currentTarget), 0 max abs(parseNumber(ctrlText 330)) min 50];
GVAR(targetRange) set [GVAR(currentTarget), 0 max abs(parseNumber(ctrlText 340)) min 4000];

private ["_boreHeight", "_bulletMass", "_airFriction", "_muzzleVelocity"];
_boreHeight = parseNumber(ctrlText 100);
_bulletMass = parseNumber(ctrlText 110);
if ((missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) && (missionNamespace getVariable [QEGVAR(advanced_ballistics,AdvancedAirDragEnabled), false])) then {
    _airFriction = 0.1 max parseNumber(ctrlText 120) min 2;
} else {
    _airFriction = parseNumber(ctrlText 120) / -1000;
};
_muzzleVelocity = parseNumber(ctrlText 130);
if (GVAR(currentUnit) == 1) then
{
    _boreHeight = _boreHeight * 2.54;
    _bulletMass = _bulletMass * 0.06479891;
    _muzzleVelocity = _muzzleVelocity / 3.2808399;
};
_boreHeight = 0.1 max _boreHeight min 10;
_bulletMass = 1 max _bulletMass min 100;
_muzzleVelocity = 100 max _muzzleVelocity min 1400;

GVAR(workingMemory) set [5, _boreHeight];
GVAR(workingMemory) set [12, _bulletMass];
if ((missionNamespace getVariable [QEGVAR(advanced_ballistics,enabled), false]) && (missionNamespace getVariable [QEGVAR(advanced_ballistics,AdvancedAirDragEnabled), false])) then {
    GVAR(workingMemory) set [15, _airFriction];
} else {
    GVAR(workingMemory) set [4, _airFriction];
};
GVAR(workingMemory) set [1, _muzzleVelocity];

private ["_elevationCur", "_windageCur", "_elevationScopeStep", "_windageScopeStep"];
_elevationCur = parseNumber(ctrlText 402);
_windageCur = parseNumber(ctrlText 412);

switch (GVAR(currentScopeUnit)) do
{
    case 0:
    {		
        _elevationCur = _elevationCur * 3.38;
        _windageCur = _windageCur * 3.38;
    };
    
    case 2:
    {		
        _elevationCur = _elevationCur / 1.047;
        _windageCur = _windageCur / 1.047;
    };
    
    case 3:
    {
        _elevationScopeStep = (GVAR(workingMemory) select 7);
        _windageScopeStep = (GVAR(workingMemory) select 8);
        
        _elevationCur = _elevationCur * _elevationScopeStep;
        _windageCur = _windageCur * _windageScopeStep;
    };
};

GVAR(workingMemory) set [10, _elevationCur];
GVAR(workingMemory) set [11, _windageCur];

[] call FUNC(update_gun);
[] call FUNC(update_atmosphere);
[] call FUNC(update_target);
