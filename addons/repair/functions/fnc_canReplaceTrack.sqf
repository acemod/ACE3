/*
 * Author: commy2
 * Check if the unit can replace given wheel of the vehicle.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint <STRING>
 * 3: Track <OBJECT>/<BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_canReplaceTrack
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target", "_hitPoint", ["_track", false]];
TRACE_4("params",_unit,_target,_hitPoint,_track);
// TODO [_unit, _track] call EFUNC(common,claim); on start of action

if (typeName _track == "OBJECT") then {
    // not near interpret as objNull
    if !(_track in nearestObjects [_unit, ["ACE_Track"], 5]) then {
        _track = objNull;
    };
} else {
    _track = objNull;

    {
        if ([_unit, _x, ["isNotDragging", "isNotCarrying"]] call EFUNC(common,canInteractWith)) exitWith {
            _track = _x;
        };
    } forEach nearestObjects [_unit, ["ACE_Track"], 5];
};

if (isNull _track) exitWith {false};

alive _target && {_target getHitPointDamage _hitPoint >= 1}
