// by commy2

private ["_weapon", "_mode"];

_weapon = _this select 0;

_mode = getArray (configFile >> "CfgWeapons" >> _weapon >> "modes") select 0;

[_mode, _weapon] select (_mode == "this")
