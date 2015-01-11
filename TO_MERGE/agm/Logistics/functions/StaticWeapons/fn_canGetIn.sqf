// by commy2

private ["_vehicle", "_config", "_turret", "_configTurret", "_memoryPointGunner", "_distance"];

_vehicle = _this select 0;

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;

_turret = [typeOf _vehicle] call AGM_Core_fnc_getTurretGunner;
_configTurret = [_config, _turret] call AGM_Core_fnc_getTurretConfigPath;

if (_turret isEqualTo []) exitWith {false};

_memoryPointGunner = getText (_configTurret >> "memoryPointsGetInGunner");

_distance = getNumber (_config >> "getInRadius");

isNull (gunner _vehicle) &&
{alive _vehicle} &&
{!(_vehicle lockedTurret _turret)} &&
{getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "isUav") != 1} &&
{player distance (_vehicle modeltoworld (_vehicle selectionPosition _memoryPointGunner)) < _distance || {vehicle player == _vehicle}}
