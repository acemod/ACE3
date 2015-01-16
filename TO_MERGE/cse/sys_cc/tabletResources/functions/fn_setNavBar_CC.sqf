

private ["_deviceName","_settings","_display","_pos","_ctrl", "_moment", "_lastNumber"];
_deviceName = _this select 0;
_pos = _this select 1;
_settings = [_deviceName] call cse_fnc_getNavBarRatio_CC;

disableSerialization;
_display = uiNamespace getvariable _deviceName;
_ctrl = (_display displayCtrl 3);

_newPos = switch (_pos) do {
	case "top": {_settings};
	case "hidden": {[0,0,0,0]};
};
_ctrl ctrlsetPosition _newPos;
_ctrl ctrlCommit 0;

_allowsideBar = {
	private["_deviceName","_cfg","_allowSideBar"];
	_deviceName = _this select 0;
	_allowSidebar = 0;
	if (isnil 'CSE_REGISTERED_DEVICES_CC') then {
		CSE_REGISTERED_DEVICES_CC = [];
	};

	{
		if (_x select 0 == _deviceName) exitwith {
			_allowSidebar = _x select 2;
		};
	}foreach CSE_REGISTERED_DEVICES_CC;
	(_allowSidebar > 0)
};

if ([_deviceName] call _allowsideBar) then {
	_openSideBarCtrl = (_display displayCtrl 4);
	_openSideBarCtrl ctrlSetPosition [
		(_settings select 0) + (( _settings select 2) - (_settings select 3)),
		(_settings select 1),
	  	(_settings select 3),
	 	(_settings select 3)
	];
	_openSideBarCtrl ctrlCommit 0;
	_openSideBarCtrl ctrlSetEventHandler ["ButtonClick", format["['%1','toggle'] call cse_fnc_setSideBar_CC;",_deviceName]];
};

_navBarIconHomeCtrl = (_display displayCtrl 199);
_navBarIconHomeCtrl ctrlSetPosition [(_settings select 0),(_settings select 1),(_settings select 3),(_settings select 3)];
_navBarIconHomeCtrl ctrlSetText "cse\cse_sys_cc\data\home_icon.paa";
_navBarIconHomeCtrl ctrlCommit 0;

(_display displayCtrl 198) ctrlSetPosition [(_settings select 0),(_settings select 1),(_settings select 3),(_settings select 3)];
(_display displayCtrl 198) ctrlCommit 0;
(_display displayCtrl 198) ctrlSetEventHandler ["ButtonClick", format["['%1','home'] call cse_fnc_openScreen_CC;",_deviceName]];

_infoLabelCtrl = (_display displayCtrl 5);
_infoLabelCtrl ctrlSetPosition [
	(_settings select 0),
	(_settings select 1),(_settings select 2) - (_settings select 3),(_settings select 3)
];
_infoLabelCtrl ctrlCommit 0;
[_infoLabelCtrl] spawn {
	disableSerialization;
	_infoLabelCtrl = _this select 0;
	while {dialog} do {
		_lastNumber = date select 4;
		_moment = format["%1:%2",date select 3, _lastNumber];
		if (_lastNumber < 10) then {
			_moment = format["%1:0%2",date select 3, _lastNumber];
		};
		_infoLabelCtrl ctrlSetText _moment;
	};
};