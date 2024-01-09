#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, johnb43
 * Creates a draggable / carryable clone of a dead unit.
 *
 * Arguments:
 * 0: Dead unit <OBJECT>
 *
 * Return Value:
 * Cloned unit <OBJECT>
 *
 * Example:
 * [player] call ace_dragging_fnc_createClone;
 *
 * Public: No
 */

params ["_target"];

// Get current position of unit, -10 m below surface
private _posATL = getPosATL _target;
_posATL set [2, -10];

private _clone = createVehicle [QGVAR(clone), _posATL];

// Clone loadout
[_clone, _target call CBA_fnc_getLoadout] call CBA_fnc_setLoadout;

// Hide unit until it can be moved below terrain
private _isObjectHidden = isObjectHidden _target;

if (!_isObjectHidden) then {
    [QEGVAR(common,hideObjectGlobal), [_target, true]] call CBA_fnc_serverEvent;
};

private _simulationEnabled = simulationEnabled _target;

if (_simulationEnabled) then {
    [QEGVAR(common,enableSimulationGlobal), [_target, false]] call CBA_fnc_serverEvent;
};

private _isInRemainsCollector = isInRemainsCollector _target;

// Make sure corpse isn't deleted by engine's garbage collector
if (_isInRemainsCollector) then {
    removeFromRemainsCollector [_target];
};

// Make sure clone has the same wound textures as the corpse
private _targetDamage = damage _target;
if (_targetDamage != 0) then {
    _clone setDamage (_targetDamage min 0.99); // Don't kill the clone
};
private _relevantHitpoints = ["HitHead", "HitBody", "HitHands", "HitLegs"];
{
    private _hitpointDamage = _target getHitPointDamage _x;
    _clone setHitPointDamage [_x, _hitpointDamage min 0.99];
} forEach _relevantHitpoints;

// Disable all damage
_clone allowDamage false;
_clone setVariable [QGVAR(original), [_target, _isInRemainsCollector, _isObjectHidden, _simulationEnabled], true];

// Turn on PhysX so that the corpse doesn't desync when moved
[QEGVAR(common,awake), [_target, true]] call CBA_fnc_globalEvent;

[{
    params ["_target", "_posATL"];

    // Make sure PhysX is on
    [QEGVAR(common,awake), [_target, true]] call CBA_fnc_globalEvent;

    // Move unit below terrain in order to hide it and remove its inventory access
    _target setPosATL _posATL;
}, [_target, _posATL], 0.1] call CBA_fnc_waitAndExecute;

// Sets the facial expression
[[QGVAR(cloneCreated), [_target, _clone]] call CBA_fnc_globalEventJIP, _clone] call CBA_fnc_removeGlobalEventJIP;

_clone
