/**
 * fn_getOptionFieldOnPos_CC.sqf
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

private ["_deviceName","_settings","_display","_pos","_ctrl","_options","_idcStart","_ctrlPosition","_return","_possibleTypes","_sideBarHeight","_buttonHeightwithSpacing","_buttonSpacing","_buttonHeight","_maxPositions"];
_deviceName = _this select 0;
_pos = _this select 1;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_sideBarRatio = [_deviceName] call cse_fnc_getSideBarRatio_CC;
_navBarRatio = [_deviceName] call cse_fnc_getNavBarRatio_CC;
_maxPositions = (_settings select 3) / 0.05;
_maxPositions = 12;
_sideBarHeight = _sideBarRatio select 3;
_buttonHeightwithSpacing = _sideBarHeight / _maxPositions;
_buttonSpacing = _buttonHeightwithSpacing / 20;
_buttonHeight = _buttonHeightwithSpacing - _buttonSpacing;

_ctrlPosition = [(_sideBarRatio select 0) + 0.001, (_sideBarRatio select 1) + (_navBarRatio select 3)/1.5, (_sideBarRatio select 2) - 0.002, _buttonHeight];
_ctrlPosition set[1, (_ctrlPosition select 1) + (_pos * (_buttonHeight + _buttonSpacing))+ 0.002];

_display = uiNamespace getvariable _deviceName;
_return = controlNull;

	_possibleTypes = ["label","drop","button","edit"];
	{
		_idcStart = switch (_x) do {
			case "label": {
				START_LABEL_IDC
			};
			case "drop": {
				START_LB_IDC
			};
			case "button": {
				START_BUTTON_IDC
			};
			case "edit": {START_EDIT_IDC};
			default {-1};
		};
		private ["_i","_foundPos"];
		for [{_i=_idcStart},{_i < _idcStart + 10},{_i=_i+1}] do {
			_ctrl = (_display displayCtrl _i);
			_foundPos = ctrlPosition _ctrl;

			if (((_foundPos select 0 == _ctrlPosition select 0) && (_foundPos select 1 == _ctrlPosition select 1) && (_foundPos select 2 == _ctrlPosition select 2) && (_foundPos select 3 == _ctrlPosition select 3))) then {
				_return = _ctrl;
			};
		};
	}foreach _possibleTypes;
_return