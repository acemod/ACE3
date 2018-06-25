#include "script_component.hpp"
/*
 * Author: commy2
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
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
 * [unit, vehicle, "hitpoint", "RepairTrack", [], [], [aTrack]] call ace_repair_fnc_doRepairTrack
 *
 * Public: No
 */

params ["_unit", "_vehicle", "_hitPoint", "", "", "", "_claimedObjects"];
TRACE_4("params",_unit,_vehicle,_hitPoint,_claimedObjects);

_claimedObjects params [["_track", objNull]];
if ((isNull _track) || {!([_unit, _track, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith))}) exitWith {
    ERROR_1("Bad Track", _claimedObjects);
};

// can't use a destroyed track
if ((damage _track) >= 1) exitWith {};

// get current hitpoint damage
private _hitPointDamage = _vehicle getHitPointDamage _hitPoint;
private _damageRepaired = (1 - (damage _track)) / 4; // require 4 tracks to fully replace one side

// don't die by spawning / moving the wheel
_hitPointDamage = (_hitPointDamage - _damageRepaired) min 0;
deleteVehicle _track;

// raise event to set the new hitpoint damage
[QGVAR(setWheelHitPointDamage), [_vehicle, _hitPoint, _hitPointDamage], _vehicle] call CBA_fnc_targetEvent;

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    [LSTRING(ReplacedTrack)] call EFUNC(common,displayTextStructured);
};
