/*
	Name: AGM_Explosives_fnc_getPlacedExplosives
	
	Author: Garth de Wet (LH)
	
	Description:
		Gets all placed explosives, whether Clacker based or not.
	
	Parameters: 
		0: OBJECT - unit
		1: STRING - (OPTIONAL) Trigger classname for filter.
	
	Returns:
		Array: Explosives.
	
	Example:
		_allExplosives = [player] call AGM_Explosives_fnc_getPlacedExplosives;
		_deadmanExplosives = [player, "DeadManSwitch"] call AGM_Explosives_fnc_getPlacedExplosives;
*/
private ["_unit", "_clackerList", "_adjustedList", "_list", "_filter"];
_unit = _this select 0;
_filter = nil;
if (count _this > 1) then {
	_filter = ConfigFile >> "CfgAGM_Triggers" >> (_this select 1);
};
_clackerList = [];
_adjustedList = false;
_clackerList = _unit getVariable ["AGM_Clacker", []];
_list = [];
{
	if isNull (_x select 0) then {
		_clackerList set [_foreachIndex, "X"];
		_adjustedList = true;
	} else {
		if (isNil "_filter" || {(ConfigFile >> "CfgAGM_Triggers" >> (_x select 4)) == _filter}) then {
			_list pushBack _x;
		};
	};
} foreach _clackerList;
if (_adjustedList) then {
	_clackerList = _clackerList - ["X"];
	if (count _clackerList == 0) then {
		_unit SetVariable ["AGM_Clacker", nil, true];
	} else {
		_unit SetVariable ["AGM_Clacker", _clackerList, true];
	};
};

_list