/**
 * fn_getEntryToMenuSorter_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_menuName","_currentEntries", "_returnEntries", "_target", "_toAddEntry"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_target = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_Param;

_currentEntries = missionNamespace getvariable ["cse_radiusInteraction_f_entries_sorter_"+_menuName, []];
_returnEntries = [];
{
	_entry = _x;
	if (typeName (_entry select 3) == typeName {}) then {
		if ([player, _target] call (_entry select 3)) then {
			_toAddEntry = +_entry;
			_toAddEntry set [ 3, true];
			_returnEntries pushback _toAddEntry;
		};
	} else {
		if (_entry select 3) then {
			_returnEntries pushback (+ _x);
		};
	};
}foreach _currentEntries;
_returnEntries;