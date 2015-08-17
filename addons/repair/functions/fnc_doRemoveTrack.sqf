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
#include "script_component.hpp"

params ["_unit", "_vehicle", "_hitPoint"];
TRACE_3("params",_unit,_vehicle,_hitPoint);
// TODO [_unit, _wheel] call EFUNC(common,claim); on start of action
// get current hitpoint damage
private "_hitPointDamage";
_hitPointDamage = _vehicle getHitPointDamage _hitPoint;

// can't remove destroyed or already removed wheel
if (_hitPointDamage >= 1) exitWith {};

// don't die by spawning / moving the wheel
["fixCollision", _unit] call EFUNC(common,localEvent);

// spawn wheel
private "_wheel";
_wheel = ["ACE_Track", getPosASL _unit] call FUNC(spawnObject);
_wheel setdamage _hitPointDamage;

// raise event to set the new hitpoint damage
["setWheelHitPointDamage", _vehicle, [_vehicle, _hitPoint, 1]] call EFUNC(common,targetEvent);

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    [localize LSTRING(RemovedTrack)] call EFUNC(common,displayTextStructured);
};
