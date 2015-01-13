/**
 * fn_popUpAccept_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define START_IDC_LABEL 		240
#define START_IDC_COMBO			250
#define START_IDC_BTN			260
#define START_IDC_LIST			280
#define START_IDC_INPUT			270

private ["_deviceName","_display","_ctrlBtn","_ctrlLbl","_ctrlCmbo","_return","_name","_type","_action","_ctrlRight","_ctrlLeft","_content","_ctrlInput"];
_deviceName = _this select 0;

disableSerialization;
_display = uiNamespace getvariable _deviceName;

_ctrlBtn = START_IDC_BTN;
_ctrlLbl = START_IDC_LABEL;
_ctrlCmbo = START_IDC_COMBO;
_ctrlInput = START_IDC_INPUT;
_return = [];
_selectables = [];
{
	_name = _x select 0;
	_type = _x select 1;
	_action = _x select 2;

	switch (_type) do {
		case "btn": {
			_ctrlRight = (_display displayCtrl _ctrlBtn);
			_ctrlBtn = _ctrlBtn + 1;
			_selectables pushback -1;
		};
		case "label": {
			_ctrlRight = (_display displayCtrl _ctrlLbl);
			_ctrlLbl = _ctrlLbl + 1;
			_selectables pushback -1;
		};
		case "combo": {
			_ctrlRight = (_display displayCtrl _ctrlCmbo);
			_ctrlLeft = (_display displayCtrl _ctrlLbl);
			_ctrlCmbo = _ctrlCmbo + 1;
			_ctrlLbl = _ctrlLbl + 1;

			_content = (_x select 3);
			if (isnil "_content") then {
				_content = [];
			};
			if (typeName _content != typeName []) then {
				_content = [];
			};

			_selected = lbCurSel _ctrlRight;
			if (_selected <0) then {
				_selected = 0;
			};
			_value = (_content select _selected);
			_return pushback _value;
			_selectables pushback _selected;
		};
		case "input": {
			_ctrlRight =  (_display displayCtrl _ctrlInput);
			_ctrlInput = _ctrlInput + 1;
			_return pushback (ctrlText _ctrlRight);
			_selectables pushback -1;
		};
		default {};
	};
}foreach CSE_POP_UP_OPTIONS_CC;
_return pushback _selectables;

_return