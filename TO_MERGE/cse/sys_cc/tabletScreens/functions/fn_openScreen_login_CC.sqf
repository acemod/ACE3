private ["_deviceName"];
_deviceName = _this select 0;
hint 'you are required to log in';

[_deviceName,"open","login"] spawn cse_fnc_setPopUpMenu_CC;

