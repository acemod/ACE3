private ["_unit", "_target"];
_unit = [_this, 0, objNull, [objNull]] call bis_fnc_param;
_target = [_this, 1, objNull, [objNull]] call bis_fnc_param;


([_unit,_target] call cse_fnc_canRefill_FR);