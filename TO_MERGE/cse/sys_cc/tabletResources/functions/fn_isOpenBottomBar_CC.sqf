/**
 * fn_isOpenBottomBar_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_return","_idc"];
_deviceName = _this select 0;
_display = uiNamespace getvariable _deviceName;
_idc = 155;
!((ctrlPosition ((_display displayCtrl _idc)) select 0 == 0) && ((ctrlPosition (_display displayCtrl _idc)) select 2 == 0))