#include "script_component.hpp"
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
 * Example:
 * [car] call ace_common_fnc_getVehicleCargo
 *
 * Public: Yes
 */

params [["_vehicle", objNull, [objNull]]];

private _config = configFile >> "CfgVehicles" >> _vehicle;

private _cargo = [];
private _codrivers = getArray (_config >> "cargoIsCoDriver");

for "_index" from 0 to (getNumber (_config >> "transportSoldier") - 1) do {
    if !(_index in _codrivers && {_vehicle isKindOf "Car"} && {!(_vehicle isKindOf "Wheeled_APC_F")}) then {
        _cargo pushBack _index;
    };
};

_cargo
