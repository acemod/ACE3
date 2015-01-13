/**
 * fn_actionRefill_FR.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit", "_item", "_onRefill", "_time", "_res"];
_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_item = [_this, 1, "", [""]] call BIS_fnc_param;
_time = [_this, 2, 0, [0]] call BIS_fnc_param;


CSE_ORIGINAL_POSITION_PLAYER = getPos _unit;
_res = [_time,{((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER) < 1)}, {},{[player, "STR_CSE_CMS_CANCELED", ["STR_CSE_CMS_ACTION_CANCELED","STR_CSE_CMS_YOU_MOVED_AWAY"]] call cse_fnc_sendDisplayInformationTo;}] call cse_fnc_gui_loadingBar;


if ([_item] call cse_fnc_itemIsRefillable_FR && _res) then {
	_unit removeItem _item;
	_onRefill = getText(ConfigFile >> "CfgWeapons" >> _item >> "cse_onRefill");
	if (_onRefill != "") then {
		_unit addItem _onRefill;
	};
	[format["ACTION REFILL: %1 FOUND %2 %3",_unit, _item, _onRefill]] call cse_fnc_debug;
};