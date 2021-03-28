#include "script_component.hpp"
/*
 * Author: commy2
 * Replaces a track.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint <STRING>
 * 3: Repair Action Classname (Not used) <STRING>
 * 4: (Not used) <ARRAY>
 * 5: (Not used) <ARRAY>
 * 6: Required Repair Objects <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, vehicle, "hitpoint", "ReplaceTrack", [], [], [aTrack]] call ace_repair_fnc_doReplaceTrack
 *
 * Public: No
 */

params ["_unit", "_vehicle", "_hitPoint", "", "", "", "_claimedObjects"];
TRACE_4("params",_unit,_vehicle,_hitPoint,_claimedObjects);

_claimedObjects params [["_track", objNull]];
if ((isNull _track) || {!([_unit, _track, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith))}) exitWith {
    ERROR_1("Bad Track", _claimedObjects);
};

// get current hitpoint damage
private _hitPointDamage = _vehicle getHitPointDamage _hitPoint;

// can't replace not destroyed wheel
if (_hitPointDamage < 1) exitWith {};

// get track's damage
private _newHitPointDamage = damage _track;

// can't replace with a destroyed wheel
if (_newHitPointDamage >= 1) exitWith {};

deleteVehicle _track;

// raise event to set the new hitpoint damage
[QGVAR(setWheelHitPointDamage), [_vehicle, _hitPoint, _newHitPointDamage], _vehicle] call CBA_fnc_targetEvent;

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    [LSTRING(ReplacedTrack)] call EFUNC(common,displayTextStructured);
};
