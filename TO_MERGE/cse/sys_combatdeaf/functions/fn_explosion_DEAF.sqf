private ["_unit", "_damage", "_attenuation", "_sp"];
_unit   = _this select 0;
_damage = _this select 1;

_attenuation = player call cse_fnc_getAttenuation_DEAF;

_sp = _attenuation * _damage * 500;
_sp call cse_fnc_handlePressureWave_DEAF;
