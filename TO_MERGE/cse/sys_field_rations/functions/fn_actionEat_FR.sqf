/**
 * fn_actionEat_FR.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit", "_item", "_time", "_res"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_item = [_this, 1, "", [""]] call BIS_fnc_param;
_time = [_this, 2, 0, [0]] call BIS_fnc_param;


["cse_fieldRations_actionConsuming", true, CSE_ICON_PATH + "icon_survival.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;

CSE_ORIGINAL_POSITION_PLAYER = getPos _unit;
_res = [_time,{((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER) < 1)}, {},{[player, "STR_CSE_CMS_CANCELED", ["STR_CSE_CMS_ACTION_CANCELED","STR_CSE_CMS_YOU_MOVED_AWAY"]] call cse_fnc_sendDisplayInformationTo;}] call cse_fnc_gui_loadingBar;

["cse_fieldRations_actionConsuming", false, "cse\cse_sys_field_rations\data\icons\icon_drinking.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;


if ([_item] call cse_fnc_itemIsEatable_FR && _res) then {
	_unit removeItem _item;
	_unit setvariable ["cse_food_status_fr", ((_unit getvariable ["cse_food_status_fr", 100]) + ([_item] call cse_fnc_getEatableValue_FR)) min 100];

	[format["ACTIONEAT: %1 FOUND %2",_unit, _item]] call cse_fnc_debug;
	if ((_unit getvariable ["cse_food_status_fr", 100]) >= 100) then {
		hint "You feel stuffed..";
	};
};