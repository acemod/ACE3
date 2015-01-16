/**
 * fn_openIconSelectMenu_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_device","_position", "_unit", "_currentInfo", "_opt"];
_device = _this select 0;
_position = _this select 1;


// figure out side with device!
[_device,"open","SELECTED TRACKER", format["[CSE_CLICKED_ON_MAP_FOUND_CC, _this] call cse_fnc_updateTrackerInfo_CC;"]] call cse_fnc_setPopUpMenu_CC;

_unit = CSE_CLICKED_ON_MAP_FOUND_CC select 5;
_currentInfo = _unit getvariable ["cse_bft_info_cc",["Infantry"," ",true,false]];

_opt = [
		["Type:","combo","",
			["Infantry","Motorized","Plane","Helicopter","Armor","Naval","HQ","Medical","Maintanance","Artillery","Mortar","Service","Recon","Mechanized","uav","Unknown"]
		],
		[_currentInfo select 0,"input", "", _currentInfo select 1]
	];
[_device,_opt] call cse_fnc_setPopUpOptions_CC;


cse_fnc_updateTrackerInfo_CC = {
	private ["_unit","_info","_currentInfo","_deviceName","_sideBarN", "_sideBarFullScreen"];
	_unit = CSE_CLICKED_ON_MAP_FOUND_CC select 5;
	_info = _this select 1;
	_currentInfo = _unit getvariable ["cse_bft_info_cc",["Infantry"," ",true,false]];
	_currentInfo set [0, _info select 0];

	_deviceName = [] call cse_fnc_getCurrentDeviceName_CC;
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

	if (_unit == player || _sideBarN == 1) then {
		_currentInfo set [1, _info select 1];
	};
	_unit setvariable ["cse_bft_info_cc",_currentInfo, true];
};