#include "script_component.hpp"
/*
 * Author: commy2
 * Check if object is a map placed bush or tree.
 *
 * Arguments:
 * 0: Object <Object>
 *
 * Return Value:
 * Is bush or tree? <BOOLEAN>
 *
 * Example:
 * cursorObject call ace_fire_fnc_isPlant
 *
 * Public: No
 */

params [["_object", objNull, [objNull]]];

_object in nearestTerrainObjects [_object, ["TREE", "SMALL TREE", "BUSH"], 0.1]
