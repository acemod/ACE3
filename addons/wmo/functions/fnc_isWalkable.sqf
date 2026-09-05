#include "..\script_component.hpp"
/*
 * Author: Bloodwyn, LinkIsGrim
 * Checks whether a unit can be anchored to an object and carried by it.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Object can be walked on <BOOL>
 *
 * Example:
 * [cursorObject] call ace_wmo_fnc_isWalkable
 *
 * Public: No
 */

params ["_object"];

// An explicit config value wins over everything, so mods can opt classes in or out.
private _walkable = getNumber (configOf _object >> QGVAR(walkable));

if (_walkable > -1) exitWith {_walkable > 0};

// Engine objects such as rope segments have no config entry to carry the property.
if ([_object] call FUNC(isExcluded)) exitWith {false};

_object isKindOf "LandVehicle" || {_object isKindOf "Air"} || {_object isKindOf "Ship"}
