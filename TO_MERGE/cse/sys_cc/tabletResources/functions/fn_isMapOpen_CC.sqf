/**
 * fn_isMapOpen_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_return","_idc"];
_deviceName = _this select 0;
_selected = _this select 1;
_display = uiNamespace getvariable _deviceName;
_idc = switch (_selected) do {
	case "main": {10};
	case "sidebar": {11};
	default {10};
};
!((ctrlPosition ((_display displayCtrl _idc)) select 0 == 0) && ((ctrlPosition (_display displayCtrl _idc)) select 1 == 0))
