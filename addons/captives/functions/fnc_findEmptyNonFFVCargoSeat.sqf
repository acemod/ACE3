#include "script_component.hpp"

params ["_vehicle"];

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

_emptyCargoSeatReturn = -1;
for "_index" from 0 to (_realCargoCount - 1) do {
    if ((!(_index in _ffvCargoIndexes)) && {!(_index in _occupiedSeats)}) exitWith {
        _emptyCargoSeatReturn = _index;
    };
};

_emptyCargoSeatReturn
