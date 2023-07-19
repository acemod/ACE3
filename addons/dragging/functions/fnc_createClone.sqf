#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, johnb43
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
params ["_target"];

private _clone = QGVAR(clone) createVehicle [0, 0, 0];

// Clone loadout
_clone setUnitLoadout getUnitLoadout _target;
[_clone, _target call BIS_fnc_getUnitInsignia] call BIS_fnc_setUnitInsignia;

// Disable all damage
_clone allowDamage false;
_clone setVariable [QGVAR(original), _target];

// Turn on PhysX so that unit is not desync when moving with 'setPos' commands
[QEGVAR(common,awake), [_target, true]] call CBA_fnc_globalEvent;

// Move unit below terrain in order to hide it
_target setPosATL [0, 0, -10];

// Turn off PhysX
[QEGVAR(common,awake), [_target, false]] call CBA_fnc_globalEvent;

// Sets the facial expression
[[QGVAR(cloneCreated), [_target, _clone]] call CBA_fnc_globalEventJIP, _clone] call CBA_fnc_removeGlobalEventJIP;

_clone
