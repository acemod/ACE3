/**
 * handleDamage_DMG.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_selectionName","_amountOfDamage", "_previousDamage", "_totalDamage"];
_unit = _this select 0;
_selectionName = _this select 1;
_amountOfDamage = _this select 2;

if (_amountOfDamage > 0.9 && {alive _unit}) then {
	_amountOfDamage = 0.9;
};

if !(["cse_sys_medical"] call cse_fnc_isModuleEnabled_F) then {
	if !(isPlayer _unit) then {
		if (_amountOfDamage >= CSE_DAMAGE_THRESHOLD_AI_DMG) then {
			[_unit] call cse_fnc_setDead;
			_amountOfDamage = 1;
		};
	} else {
		if (_amountOfDamage >= CSE_DAMAGE_THRESHOLD_PLAYERS_DMG) then {
			[_unit] call cse_fnc_setDead;
			_amountOfDamage = 1;
		};
	};
} else {
	// let CMS handle the damage
	if (([_unit] call cse_fnc_hasMedicalEnabled_CMS)) exitwith {

	};

	_previousDamage = [_unit,"cse_damageBodypartPrevious_DMG", 0] call cse_fnc_getVariable;
	[_unit,"cse_bodyPartStatusPrevious", _amountOfDamage - _previousDamage] call cse_fnc_setVariable;


	_totalDamage = [_unit,"cse_damageBodypart_DMG", 0] call cse_fnc_getVariable;
	_totalDamage = _totalDamage + (_amountOfDamage - _previousDamage);
	[_unit,"cse_damageBodypart_DMG",_totalDamage] call cse_fnc_setVariable;


	// we will handle it here.
	if !(isPlayer _unit) then {
		if (_totalDamage >= CSE_DAMAGE_THRESHOLD_AI_DMG) then {
			[_unit] call cse_fnc_setDead;
			_amountOfDamage = 1;
		};
	} else {
		if (_totalDamage >= CSE_DAMAGE_THRESHOLD_PLAYERS_DMG) then {
			[_unit] call cse_fnc_setDead;
			_amountOfDamage = 1;
		};
	};
};

_amountOfDamage