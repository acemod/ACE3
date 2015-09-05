/*
 * Author: commy2
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint <STRING>
 * 3: Repair Action Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, "hitpoint", "classname"] call ace_repair_fnc_doRepairTrack
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_vehicle", "_hitPoint", "_classname"];
TRACE_4("params",_unit,_vehicle,_hitPoint,_classname);
// TODO [_unit, _wheel] call EFUNC(common,claim); on start of action

private ["_hitPointDamage", "_newDamage", "_wheel"];

_wheel = objNull;

{
    if ([_unit, _x, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith)) exitWith {
        _wheel = _x;
    };
} forEach nearestObjects [_unit, ["ACE_Track"], 5];
if (isNull _wheel) exitwith {};

// get current hitpoint damage

_hitPointDamage = _vehicle getHitPointDamage _hitPoint;
_newDamage = (1 - (damage _wheel)) / 4; // require 4 tracks to fully replace one side

// can't replace a destroyed wheel
if ((damage _wheel) >= 1) exitWith {};
// don't die by spawning / moving the wheel
_hitPointDamage = (_hitPointDamage - _newDamage) min 0;
deleteVehicle _wheel;

// raise event to set the new hitpoint damage
["setWheelHitPointDamage", _vehicle, [_vehicle, _hitPoint, _hitPointDamage]] call EFUNC(common,targetEvent);

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    [LSTRING(ReplacedTrack)] call EFUNC(common,displayTextStructured);
};
