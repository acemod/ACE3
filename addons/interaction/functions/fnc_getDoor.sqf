/*
 * Author: commy2
 * Find door.
 *
 * Arguments:
 * 0: Distance <NUMBER>
 *
 * Return Value:
 * House objects and door <ARRAY>
 * 0: House <OBJECT>
 * 1: Door Name <STRING>
 *
 * Example:
 * [player, target] call ace_interaction_fnc_getDoor
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_distance"];

private ["_position0", "_position1", "_intersections", "_count", "_house", "_door"];

_position0 = positionCameraToWorld [0, 0, 0];
_position1 = positionCameraToWorld [0, 0, _distance];

_intersections = lineIntersectsWith [AGLToASL _position0, AGLToASL _position1, objNull, objNull, true]; // @todo LIS

_count = count _intersections;

if (_count == 0) exitWith {[objNull, ""]};

_house = _intersections select (_count - 1);

// shithouse is bugged
if (typeOf _house == "") exitWith {[objNull, ""]};

_intersections = [_house, "GEOM"] intersect [_position0, _position1];

_door = _intersections select 0 select 0;

if (isNil "_door") exitWith {[_house, ""]};

[_house, _door]
