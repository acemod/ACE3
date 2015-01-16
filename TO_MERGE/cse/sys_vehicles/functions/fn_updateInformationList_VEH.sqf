/**
 * fn_updateInformationList_VEH.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_veh","_counter","_loaded","_cmsEnabled","_status","_crew", "_display"];
_veh = _this select 0;

disableSerialization;
_display = uiNamespace getVariable 'cse_sys_vehicleMenu';
if (isNil "_display") exitwith {};
if (isNull _display) exitwith {};

_listBox = (_display displayCtrl 212);

_returnList = [];
if (CSE_LATEST_DISPLAY_OPTION_MENU_VEH == "cargo") exitwith {
	lbclear _listBox;
	_returnList = _veh getvariable ["cse_logistics_loadedCargo_LOG",[]];
	{
		_listBox lbadd (getText(configFile >> "Cfgvehicles" >> typeof _x >> "displayName"));
	}foreach _returnList;
};

if (CSE_LATEST_DISPLAY_OPTION_MENU_VEH == "crew") exitwith {
	_returnList = crew _veh;
	_cmsEnabled = ["cse_sys_medical"] call cse_fnc_isModuleEnabled_F;
	lbclear _listBox;
	{
		if (_cmsEnabled) then {
			_status = [_x] call cse_fnc_getTriageStatus_CMS;
			if ((_status select 1) >0) then {
				_nameOfUnit = ([_x] call cse_fnc_getName)  + " ["+ (_status select 0) + "]";
				_listBox lbadd _nameOfUnit;
				_listBox lbSetColor [_foreachIndex, _status select 2];
			} else {
				_listBox lbadd ([_x] call cse_fnc_getName);
			};
		} else {
			_listBox lbadd ([_x] call cse_fnc_getName);
		};
	}foreach _returnList;

//	waituntil{!(crew _veh isEqualTo _returnList)};
};

_returnList;