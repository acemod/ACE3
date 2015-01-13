/**
 * fn_handleFiredNear_DEAF.sqf
 * @Descr: N/A
 * @Author: Ruthberg
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define MAX_DISTANCE 10
#define BLUR_DELAY 0.1
#define SPEED_OF_SOUND  340.29

private ["_unit", "_firer", "_distance", "_weapon", "_ammo", "_pressureRatio", "_audibleFire", "_audibleFireToSPL", "_audibleFireDistanceCorrected", "_accessoryConfig", "_sp"];
_unit     = _this select 0;
_firer    = _this select 1;
_distance = _this select 2;
_weapon   = _this select 3;
_ammo     = _this select 6;

if (_distance > MAX_DISTANCE) exitWith {};
if (_weapon in ["Throw", "Put"]) exitWith {};
if (getNumber (configFile >> "CfgWeapons" >> _weapon >> "type") == 0) exitWith {
	[format["Weapon type was 0. Exiting (%1)", _weapon]] call cse_fnc_debug;
};

_pressureRatio = 1 / 3;
if ([_unit] call cse_fnc_isInBuilding && [_firer] call cse_fnc_isInBuilding) then {
	_pressureRatio = 1.0;
} else {
	if (_unit != _firer) then {
		// calculate direction deviation (shotdirection - (firer -> unit direction))
		_shotDirection = _firer weaponDirection currentWeapon _firer; 
		_hearerDirection = (getPosASL _firer) vectorFromTo (getPosASL _unit);
		_cosOfAngle = _shotDirection vectorCos _hearerDirection; // -1 .. +1
		_pressureRatio = (1 / 3) * (2 + _cosOfAngle); // 0.333 .. 1
		if (lineIntersects [eyePos _firer, eyePos _unit, _firer, _unit]) then {
			_pressureRatio = _pressureRatio / 2;
		};
	};
};

try {
	_audibleFire = getNumber(configFile >> "CfgAmmo" >> _ammo >> "audibleFire");
	_accessoryConfig = (configFile >> "CfgWeapons" >> ([_firer] call cse_fnc_getMuzzleAccessory_DEAF));
	if (isClass _accessoryConfig) then {
	  	_audibleFire = (getNumber (_accessoryConfig >> "ItemInfo" >> "AmmoCoef" >> "audibleFire")) * _audibleFire;
	};
	
	_distance = 1 max _distance;
	_audibleFireToSPL = abs(10 * log(1 / (4 * PI * _distance^2)));
	_audibleFireDistanceCorrected = 0 max (_audibleFire / 2^(_audibleFireToSPL / 10));
	_sp = _pressureRatio * (_unit call cse_fnc_getAttenuation_DEAF) * _audibleFireDistanceCorrected / 3;
	hintSilent format["%1, %2, %3, %4, %5, %6", _distance, _pressureRatio, (_unit call cse_fnc_getAttenuation_DEAF), _sp, _audibleFire, _audibleFireDistanceCorrected];
	
	_sp call cse_fnc_handlePressureWave_DEAF;
	_audibleFireDistanceCorrected call cse_fnc_applyEletronicEarProtection_DEAF;

	if (_sp > 1 && goggles _unit == "" && _unit != _firer) then {
		[_distance, _sp] spawn {
			private ["_distance", "_blur"];
			_distance = _this select 0;
			_blur     = (sqrt(_this select 1) / 5) min 2;
			sleep (_distance / SPEED_OF_SOUND);
			cse_sys_combatdeaf_blurEffect ppEffectEnable true;
			cse_sys_combatdeaf_blurEffect ppEffectAdjust [_blur / (_distance^2)];
			cse_sys_combatdeaf_blurEffect ppEffectCommit BLUR_DELAY;
			sleep BLUR_DELAY;
			for "_i" from floor(_distance) to MAX_DISTANCE do {
				cse_sys_combatdeaf_blurEffect ppEffectAdjust [_blur * (MAX_DISTANCE - _i)];
				cse_sys_combatdeaf_blurEffect ppEffectCommit (_blur * (BLUR_DELAY / 2));
				sleep (_blur * (BLUR_DELAY / 2));
			};
			cse_sys_combatdeaf_blurEffect ppEffectEnable false;
		};
	};
}catch {
	// This should never happen.
	if (_exception == "NO_WEAPON_UNIT") then {
		[format["Unit (%1) that fired has no weapon. Cannot retrieve silencer accessory", _firer]] call cse_fnc_debug;
	} else {
		[_exception] call cse_fnc_debug;
	};
};