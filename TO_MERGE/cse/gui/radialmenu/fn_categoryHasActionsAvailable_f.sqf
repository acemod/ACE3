/**
 * fn_categoryHasActionsAvailable_f.sqf
 * @Descr: Checks if a category has any actions available.
 * @Author: Glowbal
 *
 * @Arguments: [menuName STRING, categoryName STRING, target OBJECT (The target object for which conditions will be parsed)]
 * @Return: BOOL True if actions are available
 * @PublicAPI: true
 */

#define DEFAULT_ENTRY ["","",{}, false, ""]


private ["_menuName","_categoryName", "_entries", "_entriesAvailable", "_entry", "_target"];
_menuName = [_this, 0, "",[""]] call BIS_fnc_Param;
_categoryName = [_this, 1, "",[""]] call BIS_fnc_Param;
_target = [_this, 2, objNull, [objNull]] call BIS_fnc_Param;
_entriesAvailable = false;
_entries = [_menuName, _categoryName] call cse_fnc_getAllCategoryEntriesRadialMenu_f;
	{
		_entry = + ([_entries, _foreachIndex, DEFAULT_ENTRY,[[]],[4,5]] call BIS_fnc_Param);
		if (typeName (_entry select 3) == typeName {}) then {
			if ([player, _target] call (_entry select 3)) then {
				_entriesAvailable = true;
			};
		} else {
			if (_entry select 3) then {
				_entriesAvailable = true;
			};
		};
		if (_entriesAvailable) exitwith {};
	}foreach _entries;

_entriesAvailable