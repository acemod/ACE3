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
CSE_biometricScannerTarget = _cursor;
[] call cse_fnc_closeAllDialogs_f;
createDialog "cse_biometricScanner";

if (isnil ("cse_biometricScannerLogin")) then {
	cse_biometricScannerLogin = false;
};

if (cse_biometricScannerLogin) then {
	[player,CSE_biometricScannerTarget] call cse_fnc_hiideMainMenu;
} else {
	call cse_fnc_biometricScannerLoginScreen;
};