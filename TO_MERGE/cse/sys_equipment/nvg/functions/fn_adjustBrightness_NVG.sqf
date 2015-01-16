/**
 * fn_adjustBrightness_NVG.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_increase","_currentBrightness","_newBrightness"];
_unit = [_this,0,ObjNull,[ObjNUll]] call BIS_fnc_Param;
_increase = [_this, 1, 0,[0]] call BIS_fnc_Param;
_currentBrightness = _unit getVariable ["cse_sys_nightvision_brightness", 1];

_newBrightness = _currentBrightness + _increase;
if (_newBrightness < -0.1) then {
	_newBrightness = -0.1;
} else {
	if (_newBrightness > 2) then {
		_newBrightness = 2;
	};
};
_unit setVariable ["cse_sys_nightvision_brightness", _newBrightness];

if (_newBrightness != _currentBrightness) then {
	if (_increase > 0) then {
		hintSilent "Increased NVG Brightness";
	} else {
		hintSilent "decreased NVG Brightness";
	};
};