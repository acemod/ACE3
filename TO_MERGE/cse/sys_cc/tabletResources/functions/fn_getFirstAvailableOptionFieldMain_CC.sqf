/**
 * fn_getFirstAvailableOptionFieldMain_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define START_LABEL_IDC 	 	140
#define START_COMBO_IDC		 	150
#define START_BUTTON_IDC		160
#define START_EDIT_IDC			171
#define START_LB_IDC			180

private ["_deviceName","_display","_type","_idcStart","_return"];
_deviceName = _this select 0;
_type = _this select 1;

	disableSerialization;
	_display = uiNamespace getvariable _deviceName;

	_idcStart = switch (_type) do {
		case "label": {
			START_LABEL_IDC
		};
		case "drop": {
			START_COMBO_IDC
		};
		case "button": {
			START_BUTTON_IDC
		};
		case "edit": {
			START_EDIT_IDC
		};
		case "lb": {
			START_LB_IDC
		};
		default {-1};
	};
	_return = controlNull;
	for [{_i=_idcStart},{_i < _idcStart + 10},{_i=_i+1}] do {
		_ctrl = (_display displayCtrl _i);
		_foundPos = ctrlPosition _ctrl;
		if (_foundPos select 2 <= 0) exitwith {
			_return = _ctrl;
		};
	};
_return