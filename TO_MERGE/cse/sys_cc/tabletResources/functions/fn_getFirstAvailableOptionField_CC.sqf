/**
 * fn_getFirstAvailableOptionField_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define START_LABEL_IDC 	 	40;
#define START_LB_IDC		 	50;
#define START_BUTTON_IDC		60;
#define START_EDIT_IDC			71;

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
			START_LB_IDC
		};
		case "button": {
			START_BUTTON_IDC
		};
		case "edit": {
			START_EDIT_IDC
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