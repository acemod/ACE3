/**
 * fn_openRadialInteractionMenu_f.sqf
 * @Descr: Opens a radial menu that has been registered if condition is met
 * @Author: Glowbal
 *
 * @Arguments: [menuName STRING]
 * @Return: void
 * @PublicAPI: true
 */


#define DEFAULT_ENTRY ["","",{}, false, ""]

private ["_menuName", "_entries", "_menu", "_target"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;

_menu = missionNamespace getvariable "cse_radiusInteraction_f_"+_menuName; // [ _menuName, _displayNameMenu, _condition,_typeOfMenu,_icon,_onOpened ]
if (!isnil "_menu") then {
	_menuName = _menu select 0;
	_displayNameMenu = _menu select 1;
	_conditionOfMenu = _menu select 2;
	_typeOfMenu = _menu select 3;
	_icon = _menu select 4;
	_onOpened = _menu select 5;
	_target = [_typeOfMenu] call cse_fnc_findTargetOfMenu_GUI;
	if (isNull _target) exitwith {};
	if (!([player, _target, _menuName] call _conditionOfMenu)) exitwith {};
	if (!([_menuName,_target] call cse_fnc_hasEntriesRadialInteraction_F) && (_target != player)) then {_target = player;};
	if (isNull _target) exitwith {};
	if !([_menuName,_target] call cse_fnc_hasEntriesRadialInteraction_F) exitwith {};
	if ([_menuName, _target] call cse_fnc_radialUsesSorter_F) then {
		_entries = [_menuName] call cse_fnc_getEntryToMenuSorter_F;
	} else {
		_entries = [_menuName] call cse_fnc_getRadialInteractionEntries_F; // FORMAT [  [_menuName,_icon,_onOpened,_condition] , .. ]
	};
	[_displayNameMenu, _entries, _target] call cse_fnc_openRadialMenu_GUI;
};