/*
 * Author: Dystopian
 * Makes unit pull target body out of vehicle.
 *
 * Arguments:
 * 0: Body <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [crew cursorObject select 0, player] call ace_interaction_fnc_pullOutBody
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_body", "_unit"];

private _vehicle = objectParent _body; // vehicle command doesn't work for dead

// get target crew properties
private ["_cargoIndex", "_turretPath"];
private _cargoNumber = -1;
{
    if ("cargo" == _x select 1) then {
        INC(_cargoNumber);
    };
    if (_body == _x select 0) exitWith {
        _cargoIndex = _x select 2;
        _turretPath = _x select 3;
    };
} forEach fullCrew [_vehicle, "", true];
TRACE_3("",_cargoIndex,_cargoNumber,_turretPath);

private _preserveEngineOn = false;

// first get in to target seat
if (!(_turretPath isEqualTo [])) then {
    _unit action ["GetInTurret", _vehicle, _turretPath];
} else {
    if (_cargoIndex > -1) then {
        _unit action ["GetInCargo", _vehicle, _cargoNumber];
    } else {
        _unit action ["GetInDriver", _vehicle];
        _preserveEngineOn = isEngineOn _vehicle;
    };
};

// then get out
[
    {(_this select 0) in (_this select 1)},
    {
        params ["_unit", "_vehicle", "_preserveEngineOn"];
        TRACE_3("",_unit,_vehicle,_preserveEngineOn);
        _unit action ["GetOut", _vehicle];
        if (_preserveEngineOn) then {
            [{isNull driver _this}, {_this engineOn true}, _vehicle] call CBA_fnc_waitUntilAndExecute;
        };
    },
    [_unit, _vehicle, _preserveEngineOn]
] call CBA_fnc_waitUntilAndExecute;
