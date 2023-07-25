#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Unlocks the seat of an unconscious or dead unit after getting moved out or waking up.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params ["_unit"];

private _seat = _unit getVariable [QGVAR(lockedSeat), []];
_seat params ["_vehicle", "_type", "_position"];

if (_seat isEqualTo []) exitWith {};

switch (_type) do {
    case "driver": {
        _vehicle lockDriver false;
    };

    case "cargo": {
        _vehicle lockCargo [_position, false];
    };

    case "turret": {
        _vehicle lockTurret [_position, false];
    };
};

_unit setVariable [QGVAR(lockedSeat), nil, true];
