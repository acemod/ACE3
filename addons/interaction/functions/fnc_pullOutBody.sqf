/*
 * Author: Dystopian
 * Makes unit pull target body out of vehicle.
 *
 * Arguments:
 * 0: Target <OBJECT>
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

params ["_target", "_unit"];

private _vehicle = objectParent _target; // vehicle command doesn't work for dead

// get target crew properties
((fullCrew [_vehicle, ""] select {_target == _x select 0}) select 0) params ["", "_role", "_cargoIndex", "_turretPath"];
TRACE_3("found crew",_role,_cargoIndex,_turretPath);

private _preserveEngineOn = false;

// first get in to target seat
if (!(_turretPath isEqualTo [])) then {
    _unit action ["GetInTurret", _vehicle, _turretPath];
} else {
    if (_cargoIndex > -1) then {
        _unit action ["GetInCargo", _vehicle, _cargoIndex];
    } else {
        _unit action ["GetIn" + _role, _vehicle];
        _preserveEngineOn = (_unit == assignedDriver _vehicle) && {isEngineOn _vehicle}; // (_unit != driver _unit) here O_O
        TRACE_1("peo",_preserveEngineOn);
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
