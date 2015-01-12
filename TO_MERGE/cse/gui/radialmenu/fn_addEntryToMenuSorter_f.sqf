/**
 * fn_addEntryToMenuSorter_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_menuName","_condition","_icon","_onOpened", "_priority","_toolTip","_currentEntries"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_displayNameEntry = [_this, 1, "",[""]] call BIS_fnc_Param;
_condition = [_this, 2, {true;}, [{}]] call BIS_fnc_Param;
_icon = [_this, 3, "", [""]] call BIS_fnc_Param;
_onOpened = [_this, 4, {}, [{}]] call BIS_fnc_Param;
_priority = [_this, 5, 0, [0]] call BIS_fnc_Param;
_toolTip = [_this, 6, _displayNameEntry, [""]] call BIS_fnc_Param;



_currentEntries = missionNamespace getvariable ["cse_radiusInteraction_f_entries_sorter_"+_menuName, []];
_currentEntries pushback [_displayNameEntry,_icon,_onOpened,_condition, _toolTip];
missionNamespace setvariable ["cse_radiusInteraction_f_entries_sorter_"+_menuName, _currentEntries];

// [[1,-80,0,480,15,-40],[],{_x},"ASCEND"] call BIS_fnc_sortBy;
