/**
 * fn_getRadialInteractionEntries_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_menuName","_currentEntries"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;

_currentEntries = missionNamespace getvariable ["cse_radiusInteraction_f_entries_"+_menuName, []];

_currentEntries;