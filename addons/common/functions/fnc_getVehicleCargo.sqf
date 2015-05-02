/*
 * Author: commy2
 *
 * Get the vehicle cargo positions. Codrivers and ffv positions are not listed.
 *
 * Argument:
 * 0: Vehicle type (String)
 *
 * Return value:
 * Vehicle cargo positions. (Array)
 */
#include "script_component.hpp"

private ["_vehicle", "_config", "_cargo", "_codrivers", "_index"];

_vehicle = _this select 0;

_config = configFile >> "CfgVehicles" >> _vehicle;

_cargo = [];
_codrivers = getArray (_config >> "cargoIsCoDriver");

for "_index" from 0 to (getNumber (_config >> "transportSoldier") - 1) do {
  if !(_index in _codrivers && {_vehicle isKindOf "Car"} && {!(_vehicle isKindOf "Wheeled_APC_F")}) then {
    _cargo pushBack _index;
  };
};
_cargo
