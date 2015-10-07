/*
 * Author: commy2
 * Get the vehicle cargo positions. Codrivers and ffv positions are not listed.
 *
 * Arguments:
 * 0: Vehicle type <STRING>
 *
 * Return Value:
 * Vehicle cargo positions <ARRAY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle"];

private ["_config", "_cargo", "_codrivers"];

_config = configFile >> "CfgVehicles" >> _vehicle;

_cargo = [];
_codrivers = getArray (_config >> "cargoIsCoDriver");

for "_index" from 0 to (getNumber (_config >> "transportSoldier") - 1) do {
    if !(_index in _codrivers && {_vehicle isKindOf "Car"} && {!(_vehicle isKindOf "Wheeled_APC_F")}) then {
        _cargo pushBack _index;
    };
};

_cargo
