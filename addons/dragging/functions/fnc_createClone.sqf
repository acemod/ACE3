#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, johnb43
 * Creates a draggable / carryable clone of a dead unit.
 *
 * Arguments:
 * 0: Unit dragging/carrying <OBJECT>
 * 1: Dead unit <OBJECT>
 *
 * Return Value:
 * Cloned unit <OBJECT>
 *
 * Example:
 * [player, cursorObject] call ace_dragging_fnc_createClone;
 *
 * Public: No
 */

params ["_unit", "_target"];

// Don't sync corpse when a player joins in progress until the corpse is in its proper position
[QGVAR(disableSyncMovedCorpseOnJIP), _target] call CBA_fnc_serverEvent;

private _posATL = getPosATL _target;

// Create clone
private _clone = createVehicle [[configOf _target >> QGVAR(cloneClass), "TEXT", QGVAR(clone)] call CBA_fnc_getConfigEntry, _posATL, [], 0, "CAN_COLLIDE"];

// Claim the clone
[_unit, _clone] call EFUNC(common,claim);

// Move unit -10 m below terrain in order to hide it and remove its inventory access
_posATL set [2, -10];

// Corpse is desynced, but it doesn't matter here
_target setPosATL _posATL;

// Hide unit until it can be moved below terrain
private _isObjectHidden = isObjectHidden _target;

if (!_isObjectHidden) then {
    [QEGVAR(common,hideObjectGlobal), [_target, true]] call CBA_fnc_serverEvent;
};

// Prevents unit from falling when below terrain
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
_clone setDamage ((damage _target) min 0.99); // Don't kill the clone

{
    _clone setHitPointDamage [_x, (_target getHitPointDamage _x) min 0.99];
} forEach ["HitHead", "HitBody", "HitHands", "HitLegs"]; // Relevant hitpoints

// Disable all damage
_clone allowDamage false;
_clone setVariable [QGVAR(original), [_target, _isInRemainsCollector, _isObjectHidden, _simulationEnabled], true];

[_clone, _target call CBA_fnc_getLoadout] call CBA_fnc_setLoadout;

// Sets the facial expression
[[QGVAR(setCloneFace), [_clone, _target]] call CBA_fnc_globalEventJIP, _clone] call CBA_fnc_removeGlobalEventJIP;

// API
[QGVAR(cloneCreated), [_clone, _target]] call CBA_fnc_localEvent;

[{
    params ["_clone", "_target"];

    // Remove clone from all zeuses
    if (["ace_zeus"] call EFUNC(common,isModLoaded)) then {
        [QEGVAR(zeus,removeObjects), [[_clone]]] call CBA_fnc_serverEvent;
    };

    // Release claim on corpse
    [objNull, _target] call EFUNC(common,claim);
}, [_clone, _target], 0.25] call CBA_fnc_waitAndExecute;

// Save which curators had this object as editable
if (["ace_zeus"] call EFUNC(common,isModLoaded)) then {
    private _objectCurators = objectCurators _target;

    _target setVariable [QGVAR(objectCurators), _objectCurators, true];

    if (_objectCurators isEqualTo []) exitWith {};

    [QEGVAR(zeus,removeObjects), [[_target], _objectCurators]] call CBA_fnc_serverEvent;
};

_clone
