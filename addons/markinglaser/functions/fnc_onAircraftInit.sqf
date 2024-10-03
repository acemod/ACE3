#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Equips an aircraft with a marking laser.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [plane] call ace_markinglaser_fnc_onAircraftInit
 *
 * Public: No
 */

params ["_aircraft"];
TRACE_2("onAircraftInit",_aircraft,typeOf _aircraft);

// Assume enabled by default
if !(_aircraft getVariable [QGVAR(enabled), true]) exitWith {};

private _config = configOf _aircraft;
private _turretData = [_config] call FUNC(findTurret);
private _hasPilotCamera = getNumber (_config >> "PilotCamera" >> "controllable") > 0;

if ((_turretData isEqualTo []) && {!_hasPilotCamera}) exitWith {
    _aircraft setVariable [QGVAR(enabled), false];
    WARNING_1("Class %1 does not have a pilot camera nor a turret that could be equipped with an IR marking laser.",configName _config);
};

_aircraft setVariable [QGVAR(enabled), true];
_aircraft setVariable [QGVAR(smoothing), []];

if (_turretData isEqualTo []) then {
    TRACE_1("pilot",_turretData);
    // Use pilot camera if no turrets are available
    _aircraft setVariable [QGVAR(turretInfo), [-1]];
} else {
    TRACE_1("turret",_turretData);
    _turretData params ["_turretPath"];
    _aircraft setVariable [QGVAR(turretInfo), _turretPath];
};
