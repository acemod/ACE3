/**
 * fn_openRadialSecondRing_gui.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define DEFAULT_ENTRY ["","",{}, false, ""]


private ["_entries","_menuName", "_target", "_from", "_passEntries", "_force"];
_menuName = [_this, 0, "Main Menu",[""]] call BIS_fnc_Param;
_entries = [_this, 1, [],[[]]] call BIS_fnc_Param;
_target = [_this, 2, ObjNull, [ObjNull]] call BIS_fnc_Param;
_from = [_this, 3, 10, [0]] call BIS_fnc_Param;
_force = [_This, 4, false, [false]] call BIS_fnc_Param;

if (([_from] call cse_fnc_isRadialOptionSelected_GUI) && !_force) then {
	[] call cse_fnc_closeRadialSecondRing_GUI;
} else {
	_passEntries = [];

	{
		_entry = + ([_entries, _foreachIndex, DEFAULT_ENTRY,[[]],[4,5]] call BIS_fnc_Param);
		if (typeName (_entry select 3) == typeName {}) then {
			if ([player, _target] call (_entry select 3)) then {
				_entry set [ 3, true];
				_passEntries pushback _entry;
			};
		} else {
			if (_entry select 3) then {
				_passEntries pushback _entry;
			};
		};
	}foreach _entries;
	[_target, _passEntries, _from] call cse_fnc_setRadialSecondRing_GUI;
	[_from, true] call cse_fnc_setRadialOptionSelected_GUI;
};