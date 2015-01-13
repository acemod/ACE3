/**
 * fn_getPopUpRatio_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_spacingSide","_spacingTop","_widthOfPopUp","_heightOfPopUp"];
	disableSerialization;
	_deviceName = (call cse_fnc_getCurrentDeviceName_CC);
	_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
	_spacingSide = (_settings select 2) / 10;
	_spacingTop = (_settings select 3) / 10;
	_widthOfPopUp = ((_settings select 2)) - (_spacingSide * 2);
	_heightOfPopUp = ((_settings select 3)) - (_spacingTop * 2);

([(_settings select 0) + _spacingSide, (_settings select 1) + _spacingTop,_widthOfPopUp, _heightOfPopUp])