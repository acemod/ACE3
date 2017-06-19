/*
 * Author: commy2
 * Get the vehicle codriver positions.
 *
 * Arguments:
 * 0: Vehicle type <STRING>
 *
 * Return Value:
 * Vehicle codriver positions <ARRAY>
 *
 * Example:
 * ["car"] call ace_common_fnc_getVehicleCodriver
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_vehicle", objNull, [objNull]]];

private _config = configFile >> "CfgVehicles" >> _vehicle;

private _cargo = [];
private _codrivers = getArray (_config >> "cargoIsCoDriver");

for "_index" from 0 to (getNumber (_config >> "transportSoldier") - 1) do {
    if (_index in _codrivers && {_vehicle isKindOf "Car"} && {!(_vehicle isKindOf "Wheeled_APC_F")}) then {
        _cargo pushBack _index;
    };
};

_cargo
