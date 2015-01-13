/**
 * fn_registerDevice_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_ratio","_typeOfSideBar"];
_deviceName = _this select 0;
_ratio = _this select 1;
_typeOfSideBar = _this select 2;
_side = _this select 3;

//if (!isclass (ConfigFile >> _deviceName)) exitwith {};
if (isnil 'CSE_REGISTERED_DEVICES_CC') then {
	CSE_REGISTERED_DEVICES_CC = [];
};
if (count _ratio != 4) exitwith {};
//_navRatio = [_ratio select 0, _ratio select 1, _ratio select 2, (_ratio select 3) / 13];

CSE_REGISTERED_DEVICES_CC pushback [_deviceName,_ratio,_typeOfSideBar,_side];