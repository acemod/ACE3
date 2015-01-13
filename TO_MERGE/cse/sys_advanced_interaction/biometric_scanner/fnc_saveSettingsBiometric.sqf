/*
	NAME: fnc_biometricScanner
	USAGE: Saves the information of the biometric scanner for _cursor UNIT
	AUTHOR: Glowbal
	ARGUMENTS: OBJECT unit, OBJECT target , of type man
	RETURN: void
*/


	private ["_caller","_cursor"];
	_caller = _this select 0;
	_cursor = _this select 1;


_text1 = ctrlText 701;
_text2 = ctrlText 702;
_text3 = ctrlText 703;
_text4 = ctrlText 704;
_text5 = ctrlText 705;

_cursor setvariable ["cse_biometricScannerInfo",[_text1,_text2,_text3,_text4,_text5],true];
hint "Saved biometric";

[format["AIM - Biometric Scanner Saving. Target: %1 Information: %2",_cursor,[_text1,_text2,_text3,_text4,_text5]],2] call cse_fnc_debug;