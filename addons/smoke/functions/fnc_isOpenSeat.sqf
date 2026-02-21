#include "..\script_component.hpp"
/*
 * Author: BrettMayson
 * Check if a seat is open and thus susceptible to smoke entering, may not be accurate for vehicles with top coverings
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

if (isTurnedOut _unit) exitWith { true };

private _class = typeOf _vehicle;

private _key = _vehicle unitTurret _unit;
if (count _key >= 1) then {
    _key = [_key select 0];
} else {
    _key = [-2, _vehicle getCargoIndex _unit];
};

private _open = -1;
if (_class in GVAR(openSeatCache)) then {
    private _cache = GVAR(openSeatCache) get _class;
    if (_key in _cache) then {
        _open = _cache get _key;
    };
};
if (_open isNotEqualTo -1) exitWith { _open };

private _config = getArray (configOf _vehicle >> QGVAR(seats));
if (_config isNotEqualTo []) exitWith {
    if (count _config == 1) exitWith { _config isEqualTo [1] };
    private _path = switch (_key select 0) do {
        case -2: { [2, _key select 1] };  // cargo
        case -1: { [0, 0] }; // driver
        default { [1, _key select 0] }; // turret
    };
    private _subConfig = _config select (_path select 0);
    if (typeName _subConfig == "SCALAR") exitWith { _subConfig == 1 };
    _subConfig select (_path select 1) == 1
};

if ([_vehicle] call FUNC(isOpenVehicle)) exitWith { true };

private _eyePos = eyePos _unit;
private _intersect = lineIntersectsSurfaces [_eyePos, _eyePos vectorAdd [0, 0, 1], _unit];
private _open = (_intersect findIf { _x#2 == _vehicle }) == -1; // No intersection with vehicle roof

private _cache = GVAR(openSeatCache) getOrDefaultCall [_class, { createHashMap }, true];
_cache set [_key, _open];

_open
