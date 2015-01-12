/**
 * fn_getBarrelTemperature_wh.sqf
 * @Descr: Calculates the current barrel temperature
 * @Author: Ruthberg
 *
 * @Arguments: [unit OBJECT, weapon STRING, muzzle STRING, ammo STRING]
 * @Return: barrel temperature in degree celsius
 * @PublicAPI: true
 */
 
 
#include "defines.h"

private ["_unit", "_weapon", "_muzzle", "_ammo", "_barrelMass", "_barrelLength", "_barrelCaliber", "_area", "_barrelDiameter", "_ambientTemperature", "_barrelTemperature", "_lastUpdateTime", "_deltaTime", "_simulationStep", "_fluidVelocity", "_dynamicHeatTransferCoefficient"];
_unit   = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_ammo   = _this select 3;

_barrelMass = [_unit, _weapon, _muzzle] call cse_fnc_getBarrelMass_wh;
_barrelSurface = _barrelMass * 0.00015; // Rough estimation based on barrel mass only

_barrelLength = getNumber(configFile >> "CfgWeapons" >> _weapon >> "AB_barrelLength");
_barrelCaliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "AB_caliber");
if (_barrelLength > 0 && _barrelCaliber > 0) then {
	// Estimate barrel surface based on barrel mass and barrel length and barrel caliber
	_area = _barrelMass / (DENSITY_STAINLESS_STEEL * PI * CENTIMETER(_barrelLength));
	_barrelDiameter = sqrt(CENTIMETER(_barrelCaliber)^2 + 4 * _area);

	_barrelSurface = _barrelDiameter * PI * CENTIMETER(_barrelLength);
	_barrelSurface = _barrelSurface / 10000; // convert from m^2 to cm^2
};

_ambientTemperature = 15;
if (["cse_AB_moduleAdvancedBallistics"] call cse_fnc_isModuleEnabled_F) then {
	_ambientTemperature = ((getPosASL _unit) select 2) call cse_ab_ballistics_fnc_get_temperature_at_height;
};

_barrelTemperature = _unit getVariable [format["CSE_BarrelTemperature_%1", _weapon], _ambientTemperature];
_lastUpdateTime = _unit getVariable [format["CSE_BarrelUpdateTime_%1", _weapon], diag_tickTime];

_deltaTime = diag_tickTime - _lastUpdateTime;

while {_deltaTime > 0} do {
	_simulationStep = (_deltaTime min 1); // max step size 1 second

	// TODO: Do we want conductive heat transfer from the barrel to other parts of the weapon?

	// Source: https://de.wikipedia.org/wiki/W%C3%A4rme%C3%BCbergangskoeffizient
	// Source: https://en.wikipedia.org/wiki/Combined_forced_and_natural_convection
	_fluidVelocity = vectorMagnitude (wind vectorDiff (velocity _unit));
	_dynamicHeatTransferCoefficient = 12 * sqrt(_fluidVelocity) + 2;
	// Source: https://en.wikipedia.org/wiki/Convective_heat_transfer
	_barrelTemperature = _barrelTemperature - (HEAT_TRANSFER_COEFFICIENT_STEEL + _dynamicHeatTransferCoefficient) * _barrelSurface * (_barrelTemperature - _ambientTemperature) / (HEAT_CAPACITY_STEEL * _barrelMass) * _simulationStep;

	// Source: https://en.wikipedia.org/wiki/Thermal_radiation
	_barrelTemperature = _barrelTemperature - EMISSIVITY_STAINLESS_STEEL * STEFAN_BOLTZMANN_CONSTANT * _barrelSurface * (KELVIN(_barrelTemperature)^4 - KELVIN(_ambientTemperature)^4) / (HEAT_CAPACITY_STEEL * _barrelMass) * _simulationStep;

	_deltaTime = _deltaTime - _simulationStep;
};

_barrelTemperature
