/**
 * fn_addCategoryEntryRadialMenu_F.sqf
 * @Descr: Addes a new category entry to a radial menu
 * @Author: Glowbal
 *
 * @Arguments: [menuName STRING, categoryName STRING, displayName STRING, condition CODE, icon STRING, onPressed CODE, toolTip STRING]
 * @Return: BOOL True if succesfully added
 * @PublicAPI: true
 */

#define DEFAULT_ENTRY ["","",{}, false, ""]

private ["_menuName","_condition","_icon","_onOpened", "_position","_toolTip","_currentEntries", "_categoryName"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_categoryName = [_this, 1, "",[""]] call BIS_fnc_Param;
_displayNameEntry = [_this, 2, "",[""]] call BIS_fnc_Param;
_condition = [_this, 3, {true;}, [{}]] call BIS_fnc_Param;
_icon = [_this, 4, "", [""]] call BIS_fnc_Param;
_onOpened = [_this, 5, {}, [{}]] call BIS_fnc_Param;
_toolTip = [_this, 6, _displayNameEntry, [""]] call BIS_fnc_Param;

	// TODO parse menu name for correct value
	_currentEntries = missionNamespace getvariable ["cse_radiusInteraction_f_category_entries_"+_menuName + _categoryName, []];
	_currentEntries pushback [_displayNameEntry,_icon,_onOpened,_condition, _toolTip];
	missionNamespace setvariable ["cse_radiusInteraction_f_category_entries_"+_menuName + _categoryName, _currentEntries];
	true;