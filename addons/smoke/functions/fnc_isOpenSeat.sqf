#include "..\script_component.hpp"
/*
 * Author: BrettMayson
 * Check if a seat is open and thus susceptible to smoke entering
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Is the seat open? <BOOL>
 *
 * Example:
 * [_vehicle, _unit] call ace_smoke_fnc_isOpenSeat
 *
 * Public: Yes
 */

params [
    ["_vehicle", objNull, [objNull]],
    ["_unit", objNull, [objNull]]
];

if (_vehicle isEqualTo objNull || _unit isEqualTo objNull) exitWith { true };

private _class = typeOf _vehicle;
private _index = _vehicle getCargoIndex _unit;

private _open = -1;
if (_class in GVAR(openSeatCache)) then {
    private _cache = GVAR(openSeatCache) get _class;
    if (_index in _cache) then {
        _open = _cache get _index;
    };
};
if (_open isNotEqualTo -1) exitWith { _open };

if ([_vehicle] call FUNC(isOpenVehicle)) exitWith { true };

private _eyePos = eyePos _unit;
private _intersect = lineIntersectsSurfaces [_eyePos, _eyePos vectorAdd [0, 0, 1], _unit];
private _open = _intersect isEqualTo [];

private _cache = GVAR(openSeatCache) getOrDefaultCall [_class, { createHashMap }, true];
_cache set [_index, _open];

_open
