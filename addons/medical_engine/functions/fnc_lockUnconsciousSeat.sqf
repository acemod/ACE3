#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Locks the seat of an unconscious or dead unit to prevent automatic unloading.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
if (missionNamespace getVariable [QGVAR(disableSeatLocking), false]) exitWith {};
params ["_unit"];

private _vehicle = objectParent _unit;
TRACE_3("lockUnconsciousSeat",_unit,_vehicle,lifeState _unit);

if (isNull _vehicle) exitWith {};
if (alive _unit && {lifeState _unit != "INCAPACITATED"}) exitWith {};

switch (true) do {
    case (_unit isEqualTo (driver _vehicle)): {
        _vehicle lockDriver true;
        _unit setVariable [QGVAR(lockedSeat), [_vehicle, "driver"], true];
    };

    case (_vehicle getCargoIndex _unit != -1): {
        private _cargoIndex = _vehicle getCargoIndex _unit;
        _vehicle lockCargo [_cargoIndex, true];
        _unit setVariable [QGVAR(lockedSeat), [_vehicle, "cargo", _cargoIndex], true];
    };

    case ((_vehicle unitTurret _unit) isNotEqualTo []): {
        private _turretPath = _vehicle unitTurret _unit;
        _vehicle lockTurret [_turretPath, true];
        _unit setVariable [QGVAR(lockedSeat), [_vehicle, "turret", _turretPath], true];
    };
};
TRACE_1("locked",_unit getVariable QGVAR(lockedSeat));
