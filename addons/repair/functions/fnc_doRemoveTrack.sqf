#include "script_component.hpp"
/*
 * Author: commy2
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, "hitpoint"] call ace_repair_fnc_doRemoveTrack
 *
 * Public: No
 */

params ["_unit", "_vehicle", "_hitPoint"];
TRACE_3("params",_unit,_vehicle,_hitPoint);

// get current hitpoint damage
private _hitPointDamage = _vehicle getHitPointDamage _hitPoint;

// can't remove destroyed or already removed wheel
if (_hitPointDamage >= 1) exitWith {};

// don't die by spawning / moving the wheel
[QEGVAR(common,fixCollision), _unit] call CBA_fnc_localEvent;

// spawn track
private _newTrack = ["ACE_Track", getPosASL _unit, _hitPointDamage] call FUNC(spawnObject);
TRACE_2("new track created",_newTrack,damage _newTrack);

// raise event to set the new hitpoint damage
[QGVAR(setWheelHitPointDamage), [_vehicle, _hitPoint, 1], _vehicle] call CBA_fnc_targetEvent;

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    [localize LSTRING(RemovedTrack)] call EFUNC(common,displayTextStructured);
};
