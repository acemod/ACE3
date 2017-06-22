/*
 * Author: commy2
 * Check if Object is Overlapping
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * [player] call ace_dragging_fnc_isObjectOnObject
 *
 * Public: No
 */
params ["_object"];

(getPosATL _object select 2) - (getPos _object select 2) > 1E-5
