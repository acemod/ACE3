/*
	NAME: fnc_conditionBiometricScanner
	USAGE: checks if unit can be checked with a biometric scanner
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: boolean
*/


	private ["_caller","_cursor"];
	_caller = _this select 0;
	_cursor = _this select 1;	
	_return = false;
	
	if (_cursor iskindof "man" && group _cursor != group _caller) then {
		_return = true;
	};
	_return
