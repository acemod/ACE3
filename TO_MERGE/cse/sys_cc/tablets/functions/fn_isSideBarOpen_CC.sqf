/**
 * fn_isSideBarOpen_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_return"];
_deviceName = _this select 0;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_display = uiNamespace getvariable _deviceName;

!((ctrlPosition ((_display displayCtrl 2)) select 0 == 0) && ((ctrlPosition (_display displayCtrl 2)) select 1 == 0))
