/**
 * fn_gui_addMenuEntry.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

if (isDedicated) exitwith { [format["GUI - fnc_gui_addMenuEntry EXIT ON DEDICATED"],2] call cse_fnc_debug;};

if (isnil "cse_gui_availableMenuOptions") then {
	cse_gui_availableMenuOptions = [];
};
private ["_menuName","_optionName","_menuCondition","_menuAction","_priority"];
	_menuName = _this select 0;
	_optionName = _this select 1;
	_menuCondition = _this select 2;
	_menuAction = _this select 3;
	_priority = _this select 4;

_MENU_VAR = format["CSE_GUI_MENU_OPTIONS_%1", _menuName];
if (isnil _MENU_VAR) then {
	call compile format["%1 = [];",_MENU_VAR];
};

//[format["GUI - fnc_gui_addMenuEntry %1",_this, _MENU_VAR],2] call cse_fnc_debug;

[_menuName,_optionName,_menuCondition,_menuAction,_priority] call compile format["%1 pushback _this;",_MENU_VAR];

	//cse_gui_availableMenuOptions = cse_gui_availableMenuOptions + [[_menuName,_optionName,_menuCondition,_menuAction,_priority]];

/*
CSE_CONDITION_COMPARE_ARRAY_conditionCompareArray = [];
if (isnil 'CSE_CONDITION_COMPARE_CACHE') then {
	CSE_CONDITION_COMPARE_CACHE = [];
};
{
	_condition = _x select 2;
	if !(_condition in CSE_CONDITION_COMPARE_CACHE) then {
		CSE_CONDITION_COMPARE_CACHE set [ count CSE_CONDITION_COMPARE_CACHE , _condition ];
	} else {
		player sidechat format["CACHING CONDITION: %1",_x];
		_x set [ 2 , CSE_CONDITION_COMPARE_CACHE find _condition];
	};
}foreach (call compile (format["%1",_MENU_VAR]));*/