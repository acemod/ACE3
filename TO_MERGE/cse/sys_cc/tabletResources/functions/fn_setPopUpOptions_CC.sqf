/**
 * fn_setPopUpOptions_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define START_IDC_LABEL 		242
#define START_IDC_COMBO			250
#define START_IDC_BTN			260
#define START_IDC_LIST			280
#define START_IDC_INPUT			270

private["_deviceName","_options","_display","_settings","_spacingSide", "_spacingTop","_positionLeft","_positionRight","_widthOfPopUp","_heightOfPopUp","_ctrl","_ctrlInput", "_select"];
_deviceName = _this select 0;
_options = _this select 1;

_settings = ([_deviceName] call cse_fnc_getDeviceSettings_CC);
_spacingSide = (_settings select 2) / 10;
_spacingTop = (_settings select 3) / 10;
_widthOfPopUp = ((_settings select 2)) - (_spacingSide * 2);
_heightOfPopUp = ((_settings select 3)) - (_spacingTop * 2);

_positionLeft = [(_settings select 0) + _spacingSide + 0.01, (_settings select 1) + _spacingTop + (_heightOfPopUp / 10),(_widthOfPopUp / 2) - 0.02, _heightOfPopUp / 10];
_positionRight = [(_settings select 0) + _spacingSide + 0.01 + (_widthOfPopUp / 2), (_settings select 1) + _spacingTop + (_heightOfPopUp / 10),(_widthOfPopUp / 2) - 0.02, _heightOfPopUp / 10];

_increasePerTime = (_heightOfPopUp / 10) + 0.01;
disableSerialization;
_display = uiNamespace getvariable _deviceName;

_ctrlBtn = START_IDC_BTN;
_ctrlLbl = START_IDC_LABEL;
_ctrlCmbo = START_IDC_COMBO;
_ctrlInput = START_IDC_INPUT;

{
	_idc = _x;
	for [{_x=_idc},{_x< (_idc + 10)},{_x=_x+1}] do {
		_ctrl = (_display displayCtrl _x);
		_ctrl ctrlSetPosition [100,100,0.1,0.1]; /* Cannot use 0 for editfields */
		_ctrl ctrlCommit 0;
	};
}foreach [START_IDC_BTN,START_IDC_LABEL,START_IDC_COMBO,START_IDC_INPUT];

CSE_POP_UP_OPTIONS_CC = +_options;
{
	_name = _x select 0;
	_type = _x select 1;
	_action = _x select 2;

	switch (_type) do {
		case "btn": {
			_ctrlRight = (_display displayCtrl _ctrlBtn);
			_ctrlRight ctrlSetPosition _positionRight;
			_ctrlRight ctrlSetText _name;
			_ctrlRight ctrlCommit 0;
			_positionLeft set [ 1, (_positionLeft select 1)+_increasePerTime];
			_positionRight set [ 1, (_positionRight select 1)+_increasePerTime];
			_ctrlBtn = _ctrlBtn + 1;
		};
		case "label": {
			_ctrlRight = (_display displayCtrl _ctrlLbl);
			_ctrlRight ctrlSetPosition _positionRight;
			_ctrlRight ctrlSetText (toUpper _name);
			_ctrlRight ctrlCommit 0;

			_positionLeft set [ 1, (_positionLeft select 1)+_increasePerTime];
			_positionRight set [ 1, (_positionRight select 1)+_increasePerTime];
			_ctrlLbl = _ctrlLbl + 1;
		};
		case "combo": {
			private ["_content"];
			_ctrlRight = (_display displayCtrl _ctrlCmbo);
			_ctrlRight ctrlSetPosition _positionRight;
			_ctrlRight ctrlCommit 0;
			_content = (_x select 3);
			_select = -1;
			if (count _x > 3) then {
				_select = _x select 4;
				[format["_select %1",_select]] call cse_fnc_debug;
			};
			if (isnil "_content") then {
				_content = [];
			};
			if (typeName _content != typeName []) then {
				_content = [];
			};
			lbClear _ctrlCmbo;
			{
				_ctrlRight lbadd format["%1",_x];
			}foreach _content;
			if (_select >= 0) then {
				_ctrlRight lbSetCurSel _select;
			};
			_ctrlLeft = (_display displayCtrl _ctrlLbl);
			_ctrlLeft ctrlSetPosition _positionLeft;
			_ctrlLeft ctrlSetText (toUpper _name);
			_ctrlLeft ctrlCommit 0;

			_positionLeft set [ 1, (_positionLeft select 1)+_increasePerTime];
			_positionRight set [ 1, (_positionRight select 1)+_increasePerTime];
			_ctrlCmbo = _ctrlCmbo + 1;
			_ctrlLbl = _ctrlLbl + 1;
		};

		case "input": {
			_ctrlRight = (_display displayCtrl _ctrlInput);
			_ctrlRight ctrlSetPosition _positionRight;
			if (count _x > 3) then {
				_ctrlRight ctrlSetText (_x select 3);
			} else {
				_ctrlRight ctrlSetText "";
			};
			_ctrlRight ctrlCommit 0;

			_ctrlLeft = (_display displayCtrl _ctrlLbl);
			_ctrlLeft ctrlSetPosition _positionLeft;
			_ctrlLeft ctrlSetText (toUpper _name);
			_ctrlLeft ctrlCommit 0;

			_positionLeft set [ 1, (_positionLeft select 1)+_increasePerTime];
			_positionRight set [ 1, (_positionRight select 1)+_increasePerTime];
			_ctrlInput = _ctrlInput + 1;
			_ctrlLbl = _ctrlLbl + 1;
		};
		default {};
	};

}foreach _options;