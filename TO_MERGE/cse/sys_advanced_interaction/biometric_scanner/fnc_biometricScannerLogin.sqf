/*
	NAME: fnc_biometricScannerLogin
	USAGE: checks if the username and password have been typed correctly
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: void
*/


private ["_caller","_cursor","_return","_foundName"];
_caller = _this select 0;
_cursor = _this select 1;
_return = false;
cse_biometricScannerLogin = false;

_inputName = ctrlText 701;
_inputPass = ctrlText 702;

_foundName = "";
_foundUnit = "";
if (Ismultiplayer) then {
	{
		if (isPlayer _x) then {
			if ([_x] call cse_fnc_getName == _inputName) then {
				_foundName = [_x] call cse_fnc_getName;
				_foundUnit = _x;
			};
		};
	}foreach playableUnits;
} else {
	_foundName = [player] call cse_fnc_getName;
	_foundUnit = player;
};

if (_foundName != _inputName) exitwith {
	hint "Username incorrect!";
};

if (_inputPass == "Password") then {
	hint "Password and Username correct!";
	_return = true;
} else {
	hint "Wrong Password!";
};

if (_return) then {
	[player,CSE_biometricScannerTarget] call cse_fnc_hiideMainMenu;
	cse_biometricScannerLogin = true;
};
[] spawn {
	sleep 5;
	hintSilent "";
};
