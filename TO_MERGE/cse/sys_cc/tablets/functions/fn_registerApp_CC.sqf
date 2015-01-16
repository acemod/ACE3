/**
 * fn_registerApp_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_name","_displayName","_icon","_hideOnDesktop","_side","_sideBar","_init", "_devices"];
_name = _this select 0;
_displayName = _this select 1;
_icon = _this select 2;
_hideOnDesktop = _this select 3;
_sideBar = _this select 4;
_side = _this select 5;
_init = _this select 6;
_devices = _this select 7;

if (isnil 'CSE_REGISTERED_APPLICATIONS_CC') then {
	CSE_REGISTERED_APPLICATIONS_CC = [];
};

CSE_REGISTERED_APPLICATIONS_CC pushback [_name,_displayName,_icon,_hideOnDesktop,_sideBar,_side,_init, _devices];