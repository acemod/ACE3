

_deviceName = _this select 0;
_showTime = _this select 1;

disableSerialization;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_display = uiNamespace getvariable _deviceName;
_navBarRatio = [_deviceName] call cse_fnc_getNavBarRatio_CC;
_navBarHeight = _navBarRatio select 3;
_heightOfLB = (_settings select 3) - (_navBarHeight*2)/2;

_barPosition = [(_settings select 0) + ((_settings select 2) / 4),(_settings select 1) + ((_settings select 3) / 2) - (_navBarHeight/2) ,  (_settings select 2) / 2, _navBarHeight];
_labelPosition = [(_settings select 0) + ((_settings select 2) / 4),(_settings select 1) + ((_settings select 3) / 2) - (_navBarHeight * 1.5) ,  (_settings select 2) / 2, _navBarHeight];


_background = _display displayCtrl 607;
_bar = _display displayCtrl 606;
_label = _display displayCtrl 608;

_background ctrlSetPosition _settings;
_background ctrlSetBackgroundColor [0.8,0.8,0.8,1];
_background ctrlCommit 0;

_loadingText = "LOADING";
_label ctrlSetText _loadingText;
_label ctrlSetPosition _labelPosition;
_label ctrlCommit 0;

_bar ctrlSetPosition _barPosition;
_bar ctrlCommit 0;

_newStatus = 0;
_toSleep =  (1 / _showTime) / 20;
_start = time;
_numOfDots = 0;
_runs = 0;

while {(_newStatus <= 1.00 && !(isNull _display))} do {
	uisleep 0.01;
	_bar progressSetPosition _newStatus;
	_newStatus = _newStatus + _toSleep;
	if (_runs >= 30) then {
		_runs = 0;
		if (_loadingText == "LOADING") then {
			_loadingText = "PLEASE WAIT";
		} else {
			_loadingText = "LOADING";
		};
		_label ctrlSetText _loadingText;
	} else {
		_runs = _runs + 1;
	};
};

uisleep 0.5;
if !(isNull _display) then {
	_background ctrlSetPosition [0,0,0,0];
	_background ctrlCommit 0;

	_bar ctrlSetPosition [0,0,0,0];
	_bar ctrlCommit 0;

	_label ctrlSetText "";
	_label ctrlSetPosition [0,0,0,0];
	_label ctrlCommit 0;
};