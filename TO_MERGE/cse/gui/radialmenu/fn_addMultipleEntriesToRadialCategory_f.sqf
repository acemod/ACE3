/**
 * fn_addMultipleEntriesToRadialCategory_f.sqf
 * @Descr: Addes multiple entries to a specific category for a radial menu
 * @Author: Glowbal
 *
 * @Arguments: [menuName STRING, categoryName STRING, entries ARRAY (Format in [menuName STRING, categoryName STRING, displayName STRING, condition CODE, icon STRING, onPressed CODE, toolTip STRING])]
 * @Return: void
 * @PublicAPI: true
 */

private ["_menuName","_condition","_icon","_onOpened", "_position","_toolTip","_currentEntries", "_categoryName", "_entries"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_categoryName = [_this, 1, "",[""]] call BIS_fnc_Param;
_entries = [ _this, 2, [], [[]]] call BIS_fnc_Param;

{
	if (typeName _x == typeName []) then {
		_displayNameEntry = [_x, 0, "",[""]] call BIS_fnc_Param;
		_condition = [_x, 1, {false;}, [{}]] call BIS_fnc_Param;
		_icon = [_x, 2, "", [""]] call BIS_fnc_Param;
		_onOpened = [_x, 3, {}, [{}]] call BIS_fnc_Param;
		_toolTip = [_x, 4, _displayNameEntry, [""]] call BIS_fnc_Param;
		[_menuName,_categoryName, _displayNameEntry, _condition,_icon,_onOpened,_toolTip] call cse_fnc_addCategoryEntryRadialMenu_F;
	};
}foreach _entries;