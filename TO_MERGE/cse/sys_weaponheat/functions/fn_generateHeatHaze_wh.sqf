#define MAX_TEMP_HEAT_EFFECT 1000

private ["_unit", "_weapon", "_muzzle", "_ammo", "_malfunctionRate"];
_unit              = _this select 0;
_weapon            = _this select 1;
_muzzle            = _this select 2;
_ammo              = _this select 3;
_barrelTemperature = _this select 4;

if (_unit getVariable[format["cse_weaponHeat_TemperatureEffects_%1_%2", _weapon, _muzzle], false]) exitWith {};

if (_barrelTemperature >= 100) then {
	_unit setvariable [format["cse_weaponHeat_TemperatureEffects_%1_%2", _weapon, _muzzle], true];
	
	[_unit, _weapon, _muzzle, _ammo] spawn {
		_unit   = _this select 0;
		_weapon = _this select 1;
		_muzzle = _this select 2;
		_ammo   = _this select 3;
		
		_particleEffect = [_unit] call cse_fnc_addParticleEffectHeat_WH;
		_currentTemp = [_unit, _weapon, _muzzle, _ammo] call cse_fnc_getBarrelTemperature_wh;
		while {_currentTemp >= 100 && alive _unit} do {
			_currentTemp = [_unit, _weapon, _muzzle, _ammo] call cse_fnc_getBarrelTemperature_wh;
			if (currentWeapon _unit == _weapon) then {
				_percentage = 0 max (_currentTemp / MAX_TEMP_HEAT_EFFECT) min 1;
				[_unit, _percentage] call cse_fnc_setParticleEffectHeat_WH;
			} else {
				[_unit, 0] call cse_fnc_setParticleEffectHeat_WH;
			};
			sleep 1;
		};
		[_unit] call cse_fnc_removeParticleEffectHeat_WH;
	};
};
