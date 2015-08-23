/*
 * Author: PabstMirror
 * Finds a free cargo seat, searching non FFV first
 *
 * Arguments:
 * 0: The Vehicle <OBJECT>
 *
 * Return Value:
 * ARRAY [seat index <NUMBER>, is FFV <BOOL>]
 *
 * Example:
 * [car1] call ACE_captives_fnc_findEmptyNonFFVCargoSeat
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params", _vehicle);

_vehicleConfig = configFile >> "CfgVehicles" >> (typeOf _vehicle);

_proxyOrder = getArray (_vehicleConfig >> "getInProxyOrder");
_transportSoldier = getNumber (_vehicleConfig >> "transportSoldier");
_realCargoCount = if (isArray (_vehicleConfig >> "getInProxyOrder")) then {count _proxyOrder} else {_transportSoldier};

//Find FFV turrets:
_ffvCargoIndexes = [];
{
    _turretConfig = [_vehicleConfig, _x] call EFUNC(common,getTurretConfigPath);
    _isCargoProxy = ((getText (_turretConfig >> "proxyType")) == "CPCargo") && {isNumber (_turretConfig >> "proxyIndex")};

    if (_isCargoProxy) then {
        _proxyCargoIndex = getNumber (_turretConfig >> "proxyIndex");
        _cargoIndex = _proxyOrder find _proxyCargoIndex;
        _ffvCargoIndexes pushBack _cargoIndex;
    };
} forEach (allTurrets [_vehicle, true]);

//Find Empty Seats:
_occupiedSeats = [];
{
    _x params ["", "", "_xIndex"];
    if (_xIndex > -1) then {_occupiedSeats pushBack _xIndex;};
} forEach (fullCrew _vehicle);

TRACE_3("Searching for empty seat",_realCargoCount,_ffvCargoIndexes,_occupiedSeats);

_emptyCargoSeatReturn = [-1, false];

//First seach for non-ffv seats:
for "_index" from 0 to (_realCargoCount - 1) do {
    if ((!(_index in _ffvCargoIndexes)) && {!(_index in _occupiedSeats)}) exitWith {
        _emptyCargoSeatReturn = [_index, false];
    };
};

//Only use FFV if none found:
if (_emptyCargoSeatReturn isEqualTo [-1, false]) then {
    for "_index" from 0 to (_realCargoCount - 1) do {
        if (!(_index in _occupiedSeats)) exitWith {
            _emptyCargoSeatReturn = [_index, true];
        };
    };
};

_emptyCargoSeatReturn
