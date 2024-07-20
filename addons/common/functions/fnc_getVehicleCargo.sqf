#include "..\script_component.hpp"
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

params [["_classname", "", [""]]];

private _config = configFile >> "CfgVehicles" >> _classname;
if (isNull _config) then { ERROR_1("ace_common_fnc_getVehicleCargo bad classname %1",_this); };

private _cargo = [];
private _codrivers = getArray (_config >> "cargoIsCoDriver");

for "_index" from 0 to (getNumber (_config >> "transportSoldier") - 1) do {
    if !(_index in _codrivers && {_classname isKindOf "Car"} && {!(_classname isKindOf "Wheeled_APC_F")}) then {
        _cargo pushBack _index;
    };
};

_cargo
