#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the paradrop cargo scripted waypoint (Scheduled Environment)
 *
 * Arguments:
 * 0: Group <GROUP>
 * 1: Waypoint Position <ARRAY>
 *
 * Return Value:
 * Waypoint Finished <BOOL>
 *
 * Example:
 * [group, [0,0,0]] call ace_zeus_fnc_moduleCargoParadropWaypoint
 *
 * Public: No
 */

params [["_vehicleGroup", grpNull, [grpNull]], ["_wpPos", [0, 0, 0], [[]], 3]];
TRACE_2("moduleCargoParadropWaypoint",_vehicleGroup,_wpPos);

private _vehicle = vehicle leader _vehicleGroup;
private _commander = driver _vehicle;
private _cargo = _vehicle getVariable [QEGVAR(cargo,loaded), []];
if (!(_vehicle isKindOf "Air")) exitWith {WARNING_1("not in a air vehicle",typeOf _vehicle); true};
if (_cargo isEqualTo []) exitWith {WARNING_1("no cargo",_cargo); true};

private _previousSpeedMode = speedMode _vehicleGroup;
private _nextMoveUpdate = -1;
private _closeEnoughTicks = 0; // should prevent aircraft from endlessly going in circles trying to hit a point

// Start moving the vehicle to the drop off point
waitUntil {
    sleep 0.1;
    if ((!alive _vehicle) || {!alive _commander}) exitWith {true};

    if (CBA_missionTime > _nextMoveUpdate) then {
        private _heading = _vehicle getDir _wpPos;
        private _movePos = _vehicle getPos [1000, _heading];
        TRACE_2("move",_vehicleGroup,_movePos);
        _vehicle flyInHeight 150;
        _vehicleGroup move _movePos;
        _nextMoveUpdate = CBA_missionTime + 3;
    };
    if ((_vehicle distance2D _wpPos) < 300) then {_closeEnoughTicks = _closeEnoughTicks + 1};
    private _leadDistance = _closeEnoughTicks * 3 + linearConversion [0, 300, (speed _vehicle), 50, 100, true];
    (_vehicle distance2D _wpPos) < _leadDistance
};
TRACE_2("Finished primary movement",_vehicle distance2D _wpPos,_closeEnoughTicks);

if ((!alive _vehicle) || {!alive _commander}) exitWith {TRACE_2("died",alive _vehicle, alive _commander); true};
if (((getPos _vehicle) select 2) < 25) exitWith {TRACE_1("too low",getPos _vehicle); true};

// Fly level and straight
private _unloadFlightPos = _vehicle getRelPos [1000, 0];
_vehicle flyInHeight 150;
_vehicleGroup setSpeedMode "LIMITED";
_vehicleGroup move _unloadFlightPos;

sleep 0.5;

TRACE_2("Starting unload",_vehicle,_cargo);
{
    TRACE_1("cargo-paradropItem",_x);
    [QEGVAR(cargo,paradropItem), [_x, _vehicle, false], _vehicle] call CBA_fnc_targetEvent;
    sleep 1;
} forEach (+_cargo); // copy because array will be modified after each drop

TRACE_1("Unload finished",_vehicle);

sleep 0.5;
_vehicleGroup setSpeedMode _previousSpeedMode;

TRACE_1("WP Done",_vehicle);
true
