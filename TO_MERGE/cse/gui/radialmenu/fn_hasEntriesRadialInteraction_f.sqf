/**
 * fn_hasEntriesRadialInteraction_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_menuName","_entries", "_hasEntriesAvailable", "_target"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_target = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_Param;

if ([_menuName, _target] call cse_fnc_radialUsesSorter_F) then {
	_entries = missionNamespace getvariable ["cse_radiusInteraction_f_entries_sorter_"+_menuName, []]; // getting the direct list, otherwise it will call the conditions first
} else {
	_entries = [_menuName] call cse_fnc_getRadialInteractionEntries_F; // FORMAT [  [_menuName,_icon,_onOpened,_condition] , .. ]
};
_hasEntriesAvailable = false;
{
	_entry = _x;
	if (typeName (_entry select 3) == typeName {}) then {
		if ([player, _target] call (_entry select 3)) then {
			_hasEntriesAvailable = true;
		};
	} else {
		if (_entry select 3) then {
			_hasEntriesAvailable = true;
		};
	};

	if (_hasEntriesAvailable) exitwith {};
}count _entries;

_hasEntriesAvailable;