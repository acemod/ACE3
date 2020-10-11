#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Creates a draggable / carryable clone of a dead unit.
 *
 * Arguments:
 * 0: Dead unit <OBJECT>
 *
 * Return Value:
 * Cloned unit.
 *
 * Example:
 * [player] call ace_dragging_fnc_createClone;
 *
 * Public: No
 */
params ["_unit"];

private _clone = QGVAR(clone) createVehicle [0, 0, 0];
_clone setUnitLoadout getUnitLoadout _unit;
_clone setVariable [QGVAR(original), _unit];
_unit setPosATL [0, 0, -10];

[QGVAR(cloneCreated), [_unit, _clone]] call CBA_fnc_globalEvent;

_clone
