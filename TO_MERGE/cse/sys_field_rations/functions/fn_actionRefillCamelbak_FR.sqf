/**
 * fn_actionRefillCamelbak_FR.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

private ["_unit", "_item", "_onRefill", "_time", "_res"];
_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_time = [_this, 1, 0, [0]] call BIS_fnc_param;


CSE_ORIGINAL_POSITION_PLAYER = getPos _unit;
_res = [_time,{((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER) < 1)}, {},{[player, "STR_CSE_CMS_CANCELED", ["STR_CSE_CMS_ACTION_CANCELED","STR_CSE_CMS_YOU_MOVED_AWAY"]] call cse_fnc_sendDisplayInformationTo;}] call cse_fnc_gui_loadingBar;


if ([uniformContainer _unit] call cse_fnc_isCamelbak_FR && _res) then {
	_maxValue = getNumber(ConfigFile >> "cfgWeapons" >> typeOf (uniformContainer _unit) >> "cse_camelbak_maxContent");
	if (_maxValue > 0) then {
		_uniform = uniformContainer _unit;
		_uniform setvariable ["cse_camelbak_status_fr", _maxValue];
	};
};