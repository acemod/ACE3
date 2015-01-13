
private ["_bodyPart","_typeOfInjury","_distance","_damage","_return"];
_bodyPart = _this select 0;
_typeOfInjury = _this select 1;
_damage = _this select 2;
_distance = _this select 3;

_return = [];
switch (_typeOfInjury) do {
	case "Bullet": {
		_return = [_bodyPart, _damage,_distance] call cse_fnc_findBulletInjury;
	};
	case "Grenade": {
		_return = [_bodyPart, _damage,_distance] call cse_fnc_findBlastDamageInjury;
	};
	case "Explosive": {
		_return = [_bodyPart, _damage,_distance] call cse_fnc_findBlastDamageInjury;
	};
	case "Shell": {
		_return = [_bodyPart, _damage,_distance] call cse_fnc_findBlastDamageInjury;
	};
	case "Unknown": {
		_return = [_bodyPart, _damage,_distance] call cse_fnc_findUnknownTypeInjury;
	};
	case "Crash": {
		_return = [_bodyPart, _damage,_distance] call cse_fnc_findUnknownTypeInjury;
	};
	default {
		_return = [_bodyPart, _damage,_distance] call cse_fnc_findUnknownTypeInjury;
	};
};
_return