// by commy2

private ["_unit", "_nearObjects"];

_unit = _this select 0;

_nearObjects = nearestObjects [_unit, ["AGM_SpareWheel"], 5];
{
	if !([_unit, _x] call AGM_Core_fnc_canInteractWith) then {
		_nearObjects set [_forEachIndex, objNull];
	};
} forEach _nearObjects;
_nearObjects = _nearObjects - [objNull];

if (count _nearObjects == 0) exitWith {objNull};
_nearObjects select 0
