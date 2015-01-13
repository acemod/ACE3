/**
 * fn_assignFractures_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_unit", "_amountOfDamage", "_typeOfInjury", "_bodyPartn","_amountOfBrokenBones","_fractures","_size","_selection"];
_unit = _this select 0;
_amountOfDamage = _this select 1;
_typeOfInjury = _this select 2;
_bodyPartn = _this select 3;
_amountOfBrokenBones = 1;
_size = 1;
if (_amountOfDamage > 0.05) then {
	switch (_typeOfInjury) do {
		case "Bullet": {
			_amountOfBrokenBones = 1;
			_size = round(random(2));
		};
		case "Grenade": {
			_amountOfBrokenBones = 1;
			_size = round(random(2));
			if (_size < 1) then {
				_size = 1;
			};
		};
		case "Explosive": {
			_amountOfBrokenBones = 1;
			_size = round(random(2));
			if (_size < 1) then {
				_size = 1;
			};
		};
		case "Shell": {
			_amountOfBrokenBones = 1;
			_size = round(random(2));
			if (_size < 1) then {
				_size = 1;
			};
		};
		case "Unknown": {
			_amountOfBrokenBones = 1;
			_size = round(random(1));
		};
		case "Crash": {
			_amountOfBrokenBones = 0;
			_size = round(random(0));
		};
		default {
			_amountOfBrokenBones = 1;
			_size = round(random(1));
		};
	};
	if (_size > 2) then {
		_size = 3;
	};

	_fractures = [_unit,"cse_fractures"] call cse_fnc_getVariable;
	_selection = _fractures select _bodyPartn;
	_selection set [ _size, (_selection select _size) + _amountOfBrokenBones ];
	_fractures set [ _bodyPartn , _selection];

	[_unit, "cse_fractures",_fractures] call cse_fnc_setVariable;
};