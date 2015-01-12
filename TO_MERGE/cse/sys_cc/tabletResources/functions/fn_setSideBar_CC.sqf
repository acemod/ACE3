/**
 * fn_setSideBar_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_settings","_display","_pos","_ctrl"];
_deviceName = _this select 0;
_pos = _this select 1;
_settings = [_deviceName] call cse_fnc_getDeviceSettings_CC;
_display = uiNamespace getvariable _deviceName;

if (count (call cse_fnc_getSideBarOptionFields_CC) < 1) then {
	_pos = "hidden";
};

if (_pos == 'toggle') then {
	if ((ctrlPosition ((_display displayCtrl 2)) select 0 == 0) &&
	((ctrlPosition (_display displayCtrl 2)) select 1 == 0) && (ctrlPosition ((_display displayCtrl 2)) select 2 == 0) && (ctrlPosition ((_display displayCtrl 2)) select 3 == 0)) then {
		_pos = "right";
	} else {
		_pos = "hidden";
	};
};
disableSerialization;

_ctrl = (_display displayCtrl 2);
_newPos = switch (_pos) do {
	//case "left": {[_settings select 0, _settings select 1, (_settings select 2) / 4.5, _settings select 3]};
	case "right": {[_deviceName] call cse_fnc_getSideBarRatio_CC};
	case "hidden": {[0,0,0,0]};
	default {[0,0,0,0]};
};


_ctrl ctrlsetPosition _newPos;
_ctrl ctrlCommit 0;


for [{_i=0},{_i < 20},{_i=_i+1}] do {
	[_deviceName,_i] call cse_fnc_removeOptionField_CC;
};

if (_pos != "hidden") then {
	{
		_args = [_deviceName] + _x;
		_args call cse_fnc_setOptionField_CC;
	}foreach (call cse_fnc_getSideBarOptionFields_CC);
	[_deviceName,"hidden"] spawn cse_fnc_setPopUpMenu_CC;
	if ([_deviceName,"sidebar"] call cse_fnc_isMapOpen_CC) then {
		if (call cse_fnc_sideBarHasMap_CC) then {
			[_deviceName,"sidebar","visable"] call cse_fnc_setMap_CC;
		} else {
			[_deviceName,"sidebar","hidden"] call cse_fnc_setMap_CC;
		};
	};
} else {

	if ([_deviceName,"sidebar"] call cse_fnc_isMapOpen_CC) then {
		[_deviceName,"sidebar","invisable"] call cse_fnc_setMap_CC;
	};
};
if ([_deviceName,"main"] call cse_fnc_isMapOpen_CC) then {
	[_deviceName,"main","full"] call cse_fnc_setMap_CC;
};
if ([_deviceName,"main"] call cse_fnc_isPiPOpen_CC) then {
	[_deviceName,"main","full"] call cse_fnc_setPiP_CC;
};
if ([_deviceName] call cse_fnc_isSelectMenuOpen_CC) exitwith {
	[_deviceName] call cse_fnc_removeSelectMenu_CC;
};