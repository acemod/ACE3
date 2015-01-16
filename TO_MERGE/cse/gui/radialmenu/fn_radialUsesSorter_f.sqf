/**
 * fn_radialUsesSorter_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_menuName","_currentEntries"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;

_currentEntries = missionNamespace getvariable ["cse_radiusInteraction_f_"+_menuName, []];
if (_currentEntries isEqualTo []) exitwith { false };

(_currentEntries select 6);