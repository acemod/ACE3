#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Drops a draggable / carryable clone of a dead unit.
 *
 * Arguments:
 * 0: Clone <OBJECT>
 *
 * Return Value:
 * Original unit.
 *
 * Example:
 * [player] call ace_dragging_fnc_dropClone;
 *
 * Public: No
 */
params ["_clone"];

private _unit = _clone getVariable [QGVAR(original), objNull];
_unit setPosASL getPosASL _clone;

// Detach first to prevent objNull in attachedObjects
detach _clone;
deleteVehicle _clone;

_unit
