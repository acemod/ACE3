/**
 * fn_setMainOptionField_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_pos","_ctrl","_options","_buttonHeightwithSpacing","_sideBarHeight","_buttonHeight","_buttonSpacing"];
_deviceName = _this select 0;
_pos = round(_this select 1);
_options = _this select 2;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_sideBarRatio = [_deviceName] call cse_fnc_getSideBarRatio_CC;
_navBarRatio = [_deviceName] call cse_fnc_getNavBarRatio_CC;
_maxPositions = (_settings select 3) / 0.05;
_maxPositions = 12;
