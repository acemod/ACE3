/**
 * fn_updateClientSideOption_f.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

private ["_name","_keyBinding","_action","_idd","_keyCodePressed","_shiftPressed","_altPressed","_ctrlPressed"];
_name = _this select 0;
_keyBinding = _this select 1;

if (isnil "CSE_F_CLIENT_SIDE_SETTINGS") then {
	CSE_F_CLIENT_SIDE_SETTINGS = [];
};
{
	if ((_x select 0) == _name) exitwith {
		_x set [ 2, _keyBinding];
	};
}foreach CSE_F_CLIENT_SIDE_SETTINGS;

[_name] spawn cse_fnc_saveClientSideOptionToProfile_F;