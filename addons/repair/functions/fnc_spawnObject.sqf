/*
 * Author: commy2
 * Spawns an object of specified string, at specified position with specified damage taken.
 *
 * Arguments:
 * 0: Item classname <STRING>
 * 1: Position ASL <ARRAY>
 * 2: Damage <NUMBER>
 *
 * Return Value:
 * The new object <OBJECT>
 *
 * Example:
 * ["classname", [0, 0, 0], 1] call ace_repair_fnc_spawnObject
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item", "_position", ["_damage", 0]];
TRACE_3("params",_item,_position,_damage);

// randomized end position
_position = _position vectorAdd [1 - random 2, 1 - random 2, 0];

private _newObject = createVehicle [_item, _position, [], 0, "NONE"];
_newObject setPosASL _position;

_newObject setDamage _damage;

[QEGVAR(common,fixCollision), _newObject] call CBA_fnc_localEvent;
[QEGVAR(common,fixPosition), _newObject] call CBA_fnc_localEvent;

_newObject
