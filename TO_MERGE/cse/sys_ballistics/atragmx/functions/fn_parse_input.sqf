#include "script_component.hpp"

cse_ab_ATragMX_temperature set [cse_ab_ATragMX_currentTarget, parseNumber(ctrlText 200)];
cse_ab_ATragMX_barometricPressure set [cse_ab_ATragMX_currentTarget, 0 max parseNumber(ctrlText 210)];
cse_ab_ATragMX_relativeHumidity set [cse_ab_ATragMX_currentTarget, (0 max parseNumber(ctrlText 220) min 100) / 100];

cse_ab_ATragMX_windSpeed set [cse_ab_ATragMX_currentTarget, 0 max abs(parseNumber(ctrlText 300)) min 50];
cse_ab_ATragMX_windDirection set [cse_ab_ATragMX_currentTarget, 1 max Round(parseNumber(ctrlText 310)) min 12];
cse_ab_ATragMX_inclinationAngle set [cse_ab_ATragMX_currentTarget, -60 max parseNumber(ctrlText 320) min 60];
cse_ab_ATragMX_targetSpeed set [cse_ab_ATragMX_currentTarget, 0 max abs(parseNumber(ctrlText 330)) min 50];
cse_ab_ATragMX_targetRange set [cse_ab_ATragMX_currentTarget, 0 max abs(parseNumber(ctrlText 340)) min 4000];

private ["_boreHeight", "_bulletMass", "_airFriction", "_muzzleVelocity"];
_boreHeight = parseNumber(ctrlText 100);
_bulletMass = parseNumber(ctrlText 110);
if ((["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_F) && cse_AB_AdvancedAirDragEnabled) then {
	_airFriction = 0.1 max parseNumber(ctrlText 120) min 2;
} else {
	_airFriction = parseNumber(ctrlText 120) / -1000;
};
_muzzleVelocity = parseNumber(ctrlText 130);
if (cse_ab_ATragMX_currentUnit == 1) then
{
	_boreHeight = _boreHeight * 2.54;
	_bulletMass = _bulletMass * 0.06479891;
	_muzzleVelocity = _muzzleVelocity / 3.2808399;
};
_boreHeight = 0.1 max _boreHeight min 10;
_bulletMass = 1 max _bulletMass min 100;
_muzzleVelocity = 100 max _muzzleVelocity min 1400;

(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [5, _boreHeight];
(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [12, _bulletMass];
if ((["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_F) && cse_AB_AdvancedAirDragEnabled) then {
	(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [15, _airFriction];
} else {
	(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [4, _airFriction];
};
(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [1, _muzzleVelocity];

private ["_elevationCur", "_elevationCur", "_elevationScopeStep", "_windageScopeStep"];
_elevationCur = parseNumber(ctrlText 402);
_windageCur = parseNumber(ctrlText 412);

switch ((cse_ab_ATragMX_currentScopeUnit select cse_ab_ATragMX_currentTarget)) do
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
		_elevationScopeStep = ((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 7);
		_windageScopeStep = ((cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) select 8);

		_elevationCur = _elevationCur * _elevationScopeStep;
		_windageCur = _windageCur * _windageScopeStep;
    };
};

(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [10, _elevationCur];
(cse_ab_ATragMX_workingMemory select cse_ab_ATragMX_currentTarget) set [11, _windageCur];

call cse_ab_ATragMX_fnc_update_gun;
call cse_ab_ATragMX_fnc_update_atmosphere;
call cse_ab_ATragMX_fnc_update_target;
