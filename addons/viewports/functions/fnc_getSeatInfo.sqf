#include "..\script_component.hpp"
/*
 * Author: Dystopian, PabstMirror
 * Adapted from quickmount's addFreeSeatsActions
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * ARRAY
 *
 * Example:
 * [player] call ace_viewports_fnc_getSeatInfo
 *
 * Public: No
 */

params ["_unit"];

private _vehicle = vehicle _unit;
if (_vehicle == _unit) exitWith { [] };
private _vehicleConfig = configOf _vehicle;

private _fullCrew = fullCrew [_vehicle, "", false];
(_fullCrew select (_fullCrew findIf {_unit == _x select 0})) params ["", "_role", "_cargoIndex", "_turretPath"];

private _compartment = switch (_role) do {
    case "driver": {
        (_vehicleConfig >> "driverCompartments") call BIS_fnc_getCfgData
    };
    case "cargo": {
        // note: cargoNumber is different from the cargoIndex from fullCrew...
        private _cargoNumber = fullCrew [_vehicle, "cargo", true] findIf {_unit == _x select 0};
        private _cargoCompartments = getArray (_vehicleConfig >> "cargoCompartments");
        private _cargoCompartmentsLast = count _cargoCompartments - 1;
        _cargoCompartments select (_cargoNumber min _cargoCompartmentsLast)
    };
    default {
        private _turretConfig = [_vehicleConfig, _turretPath] call CBA_fnc_getTurret;
        (_turretConfig >> "gunnerCompartments") call BIS_fnc_getCfgData
    };
};

if (!(_compartment isEqualType "")) then { _compartment = format ["Compartment%1",_compartment] };

[_role, _cargoIndex, _turretPath, _compartment]
