#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, johnb43
 * Drops a draggable / carryable clone of a dead unit.
 *
 * Arguments:
 * 0: Unit dragging / carrying <OBJECT>
 * 1: Clone <OBJECT>
 * 2: If unit is in building <BOOL>
 *
 * Return Value:
 * Original unit <OBJECT>
 *
 * Example:
 * [player, cursorObject, false] call ace_dragging_fnc_dropClone;
 *
 * Public: No
 */
params ["_unit", "_clone", "_inBuilding"];

private _target = _clone getVariable [QGVAR(original), objNull];

if (isNull _target) exitWith {objNull};

// Turn on PhysX so that unit is not desync when moving
[QEGVAR(common,awake), [_target, true]] call CBA_fnc_globalEvent;

private _posASL = getPosASL _clone;

if (_inBuilding) then {
    _posASL = _posASL vectorAdd [0, 0, 0.05];
};

// Set the unit's direction
[QEGVAR(common,setDir), [_target, getDir _unit + 180], _target] call CBA_fnc_targetEvent;

// Bring unit back to clone's position
_target setPosASL _posASL;

// Turn off PhysX
[QEGVAR(common,awake), [_target, false]] call CBA_fnc_globalEvent;

// Detach first to prevent objNull in attachedObjects
detach _clone;
deleteVehicle _clone;

_target
