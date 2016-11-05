/*
 * Author: commy2
 * Repairs a vehicle's wheel with a ACE_wheel spare part object.
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
 * [unit, vehicle, "hitpoint", "ReplaceWheel", [], [], [aWheel]] call ace_repair_fnc_doReplaceWheel
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_vehicle", "_hitPoint", "", "", "", "_claimedObjects"];
TRACE_4("params",_unit,_vehicle,_hitPoint,_claimedObjects);

_claimedObjects params [["_wheel", objNull]];
if ((isNull _wheel) || {!([_unit, _wheel, ["isNotDragging", "isNotCarrying", "isNotOnLadder"]] call EFUNC(common,canInteractWith))}) exitWith {
    WARNING_1("Bad Claimed Wheel", _claimedObjects);
};

// get current hitpoint damage
private _hitPointDamage = _vehicle getHitPointDamage _hitPoint;

// can't replace not destroyed wheel
if (_hitPointDamage < 1) exitWith {};

// get replacement wheel's damage
private _newHitPointDamage = damage _wheel;

// can't replace a destroyed wheel
if (_newHitPointDamage >= 1) exitWith {};

deleteVehicle _wheel;

// raise event to set the new hitpoint damage
[QGVAR(setWheelHitPointDamage), [_vehicle, _hitPoint, _newHitPointDamage], _vehicle] call CBA_fnc_targetEvent;

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    [LSTRING(ReplacedWheel)] call EFUNC(common,displayTextStructured);
};
