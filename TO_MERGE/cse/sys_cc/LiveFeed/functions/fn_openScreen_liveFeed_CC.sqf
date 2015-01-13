/**
 * fn_openScreen_liveFeed_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName", "_appOpening", "_display", "_background"];
_deviceName = _this select 0;

if (isnil "CSE_LIVEFEED_TARGET_CC") exitwith {}; // error
[_deviceName,"main","full"] call cse_fnc_setPiP_CC;
[true] call cse_fnc_viewLiveFeed_CC;

CSE_PREVIOUS_APPLICATION_CC = [_deviceName] call cse_fnc_getCurrentApplication_CC;

_appOpening = "LiveFeed_Viewing";
if (CSE_LIVEFEED_TARGET_CC in allUnitsUAV) then {
	_sideBarFullScreen = {
		private["_deviceName","_cfg","_allowSidebar"];
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
		_allowSidebar
	};

	_sideBarN = ([_deviceName] call _sideBarFullScreen);
	if (_sideBarN == 1) then {
		_appOpening = _appOpening + "_UAV";
	};
};

call compile format["CSE_CURRENT_APPLICATION_%1_CC = '%2';",_deviceName, _appOpening];

if ([_deviceName] call cse_fnc_isSideBarOpen_CC) then {
	[_deviceName,"right"] call cse_fnc_setSideBar_CC;
};

_display = uiNamespace getvariable _deviceName;
_background = _display displayCtrl 602;
_background ctrlSetPosition [0,0,0,0];
_background ctrlSetBackgroundColor [0.9,0.9,0.9,1];
_background ctrlCommit 0;

(_display displayCtrl 603) ctrlSetText "";
(_display displayCtrl 604) ctrlSetText "";