/*
	NAME: fnc_biometricScanner
	USAGE: opens the biometric Scanner dialog and starts up all functionality needed
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: void
*/


	private ["_caller","_cursor"];
	_caller = _this select 0;
	_cursor = _this select 1;

hint "cancel biometric ";