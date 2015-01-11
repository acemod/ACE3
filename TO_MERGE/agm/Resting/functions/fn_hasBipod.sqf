// by commy2

private ["_weapon", "_config"];

_weapon = _this select 0;

_config = configFile >> "CfgWeapons" >> _weapon;

getNumber (_config >> "AGM_Bipod") == 1 || {getNumber (_config >> "tmr_autorest_deployable") == 1}
