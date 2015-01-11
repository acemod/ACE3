/*
 * Author: KoffeinFlummi
 *
 * Adjusts the direction of a shell.
 *
 * Arguments:
 * -> arguments of the FiredBIS EH
 *
 * Return Value:
 * None
 */

private ["_unit", "_weaponType", "_ammoType", "_magazineType", "_round", "_FCSMagazines", "_FCSElevation", "_offset"];

_unit = _this select 0;
_weaponType = _this select 1;
_ammoType = _this select 4;
_magazineType = _this select 5;
_round = _this select 6;

_FCSMagazines = _unit getVariable "AGM_FCSMagazines";
_FCSElevation = _unit getVariable "AGM_FCSElevation";

if (AGM_player != gunner _unit) exitWith {};
if !(_magazineType in _FCSMagazines) exitWith {};

// GET ELEVATION OFFSET OF CURRENT MAGAZINE
_offset = 0;
{
  if (_x == _magazineType) exitWith {
    _offset = _FCSElevation select _forEachIndex;
  };
} forEach _FCSMagazines;

[_round, (_unit getVariable "AGM_FCSAzimuth"), _offset, 0] call AGM_Core_fnc_changeProjectileDirection;

// Air burst missile
if (getNumber (configFile >> "CfgAmmo" >> _ammoType >> "AGM_Airburst") == 1) then {
	_this spawn {
		_vehicle = _this select 0;
		_projectile = _this select 6;

		_distance = _vehicle getVariable ["AGM_FCSDistance", currentZeroing _vehicle];

		if (_distance < 50) exitWith {};
		if (_distance > 1500) exitWith {};

		waitUntil {_projectile distance _vehicle > _distance || {!alive _projectile}};
		if (!alive _projectile) exitWith {};

		_position = getPosATL _projectile;

		_subMunition = createVehicle ["AGM_B_35mm_ABM_Helper", _position, [], 0, "FLY"];
		_subMunition setPosATL _position;
		_subMunition setVelocity [0, 0, -10];

		deleteVehicle _projectile;
	};
};
