/**
 * fn_addEntryToRadialInteraction_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define DEFAULT_ENTRY ["","",{}, false, ""]

private ["_menuName","_condition","_icon","_onOpened", "_position","_toolTip","_currentEntries"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_displayNameEntry = [_this, 1, "",[""]] call BIS_fnc_Param;
_condition = [_this, 2, {true;}, [{}]] call BIS_fnc_Param;
_icon = [_this, 3, "", [""]] call BIS_fnc_Param;
_onOpened = [_this, 4, {}, [{}]] call BIS_fnc_Param;
_position = [_this, 5, 0, [0]] call BIS_fnc_Param;
_toolTip = [_this, 6, _displayNameEntry, [""]] call BIS_fnc_Param;

if (_position < 8) then {
	// TODO parse menu name for correct value
	_currentEntries = missionNamespace getvariable ["cse_radiusInteraction_f_entries_"+_menuName, [DEFAULT_ENTRY, DEFAULT_ENTRY, DEFAULT_ENTRY, DEFAULT_ENTRY, DEFAULT_ENTRY , DEFAULT_ENTRY, DEFAULT_ENTRY, DEFAULT_ENTRY]];
	_currentEntries set [ _position, [_displayNameEntry,_icon,_onOpened,_condition, _toolTip]];
	missionNamespace setvariable ["cse_radiusInteraction_f_entries_"+_menuName, _currentEntries];
	true;
} else {
	false;
};