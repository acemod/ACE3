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
((fullCrew [_vehicle, ""] select {_body == _x select 0}) select 0) params ["", "_role", "_cargoIndex", "_turretPath"];
TRACE_3("found crew",_role,_cargoIndex,_turretPath);

private _preserveEngineOn = false;

// first get in to target seat
if (!(_turretPath isEqualTo [])) then {
    _unit action ["GetInTurret", _vehicle, _turretPath];
} else {
    if (_cargoIndex > -1) then {
        _unit action ["GetInCargo", _vehicle, _cargoIndex];
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
        TRACE_3("get out",_unit,_vehicle,_preserveEngineOn);
        _unit action ["GetOut", _vehicle];
        if (_preserveEngineOn) then {
            [{isNull driver _this}, {_this engineOn true}, _vehicle] call CBA_fnc_waitUntilAndExecute;
        };
    },
    [_unit, _vehicle, _preserveEngineOn]
] call CBA_fnc_waitUntilAndExecute;
