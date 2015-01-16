private ["_unit", "_weapon", "_muzzle", "_mode", "_ammo"];
_unit   = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;
_mode   = _this select 3;
_ammo   = _this select 4;

[_unit, _unit, 0, _weapon, _muzzle, _mode, _ammo] call cse_fnc_handleFiredNear_DEAF;
