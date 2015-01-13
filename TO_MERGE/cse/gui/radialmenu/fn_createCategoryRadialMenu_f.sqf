/**
 * fn_createCategoryRadialMenu_f.sqf
 * @Descr: Creates a category for a radial menu (Inner cycle)
 * @Author: Glowbal
 *
 * @Arguments: [menuName STRING, categoryName STRING, displayName STRING, condition CODE, icon STRING, position NUMBER (0 to 7), toolTip STRING]
 * @Return: BOOL True if succesfully created
 * @PublicAPI: true
 */

#define DEFAULT_ENTRY ["","",{}, false, ""]


private ["_menuName","_condition","_icon","_onOpened", "_position","_toolTip","_currentEntries", "_categorycode", "_displayNameEntry","_categoryName","_icon"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_categoryName = [_this, 1, "",[""]] call BIS_fnc_Param;
_displayNameEntry = [_this, 2, "",[""]] call BIS_fnc_Param;
_condition = [_this, 3, {true;}, [{}]] call BIS_fnc_Param;
_icon = [_this, 4, "", [""]] call BIS_fnc_Param;
_position = [_this, 5, 0, [0]] call BIS_fnc_Param;
_toolTip = [_this, 6, _displayNameEntry, [""]] call BIS_fnc_Param;

if (_position < 8) then {
	_onOpened = compile format["
		[ 	_this select 3,
			['%1', '%2'] call cse_fnc_getAllCategoryEntriesRadialMenu_f,
			_this select 1, _this select 2
		] call cse_fnc_openRadialSecondRing_GUI;",_menuName, _categoryName];

	// TODO parse menu name for correct value
	_currentEntries = missionNamespace getvariable ["cse_radiusInteraction_f_entries_"+_menuName, [DEFAULT_ENTRY, DEFAULT_ENTRY, DEFAULT_ENTRY, DEFAULT_ENTRY, DEFAULT_ENTRY , DEFAULT_ENTRY, DEFAULT_ENTRY, DEFAULT_ENTRY]];
	_currentEntries set [ _position, [_displayNameEntry, _icon,_onOpened,_condition, _toolTip]];
	missionNamespace setvariable ["cse_radiusInteraction_f_entries_"+_menuName, _currentEntries];

	missionNamespace setvariable ["cse_radiusInteraction_f_category_entries_"+_menuName+_categoryName, []];

	true;
} else {
	false;
};