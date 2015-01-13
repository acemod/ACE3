/**
 * fn_setPopUpMenu_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_toggle","_deviceName","_position","_display","_backGroundCtrl"];
_deviceName = _this select 0;
_toggle = _this select 1;


//if (([_deviceName] call cse_fnc_isPopUpOpen_CC) && _toggle == "open") exitwith { };

disableSerialization;
_display = uiNamespace getvariable _deviceName;
_backGroundCtrl = (_display displayCtrl 150);
_headerCtrl = (_display displayCtrl 151);
_headerTitle = (_display displayCtrl 152);

_buttonClose = (_display displayCtrl 154);
_buttonAccept = (_display displayCtrl 153);
if (_toggle == "open") then {
	disableSerialization;

	//_navBarSettings = [_deviceName] call cse_fnc_getNavBarRatio_CC;
	if ([_deviceName] call cse_fnc_isSideBarOpen_CC) then {
		[_deviceName,"hidden"] call cse_fnc_setSideBar_CC;
	};
	(_display displayCtrl 10) ctrlEnable false;

	_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
	_spacingSide = (_settings select 2) / 10;
	_spacingTop = (_settings select 3) / 10;
	_widthOfPopUp = ((_settings select 2)) - (_spacingSide * 2);
	_heightOfPopUp = ((_settings select 3)) - (_spacingTop * 2);

	_newPos = [(_settings select 0) + _spacingSide, (_settings select 1) + _spacingTop,_widthOfPopUp, _heightOfPopUp];
	_backGroundCtrl ctrlSetPosition _newPos;
	_backGroundCtrl ctrlCommit 0;

	_newPos set [3,_heightOfPopUp / 10];
	_headerCtrl ctrlSetPosition _newPos;
	_headerCtrl ctrlCommit 0;

	_headerTitle ctrlSetPosition _newPos;
	_headerTitle ctrlCommit 0;

	_newPos set [1, (_newPos select 1) + (_heightOfPopUp - (_heightOfPopUp / 10))];
	_newPos set [2, (_newPos select 2) / 2];
	_buttonClose ctrlSetPosition _newPos;
	_buttonClose ctrlCommit 0;

	_newPos set [0, (_newPos select 0) + (_newPos select 2)];
	_buttonAccept ctrlSetPosition _newPos;
	_buttonAccept ctrlCommit 0;

	_title = _this select 2;
	if (isnil "_title") then {
		_title = "";
	};
	if (typeName _title != typeName "") then {
		_title = "";
	};
	ctrlSetText[152,_title];


	_buttonClose ctrlSetEventHandler ["ButtonClick", format["['%1','close'] call cse_fnc_setPopUpMenu_CC",_deviceName]];

	_onAccept = (_this select 3);
	if (isnil "_onAccept") then {
		_onAccept = "";
	};
	if (typeName _onAccept != typeName "") then {
		_onAccept = "";
	};
	_buttonAccept ctrlSetEventHandler ["ButtonClick", format["(['%1'] call cse_fnc_popUpAccept_CC) call %2; ['%1','close'] call cse_fnc_setPopUpMenu_CC;",_deviceName,compile _onAccept]];

	[_deviceName, (_display displayCtrl 10)] spawn {
	 	waituntil {!([_this select 0] call cse_fnc_isPopUpOpen_CC)};
		(_this select 1) ctrlEnable true;
	};
} else {
	_newPos = [0,0,0,0];
	_backGroundCtrl ctrlSetPosition _newPos;
	_backGroundCtrl ctrlCommit 0;
	_headerCtrl ctrlSetPosition _newPos;
	_headerCtrl ctrlCommit 0;
	_headerTitle ctrlSetPosition _newPos;
	_headerTitle ctrlCommit 0;

	_buttonClose ctrlSetPosition _newPos;
	_buttonClose ctrlCommit 0;

	_buttonAccept ctrlSetPosition _newPos;
	_buttonAccept ctrlCommit 0;
	ctrlSetText[152,""];
	[_deviceName,[]] call cse_fnc_setPopUpOptions_CC;
};