/*
 * Author: commy2
 * Checks if an object is overlapping another object.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * If object is overlapping another <BOOL>
 *
 * Example:
 * [player] call ace_dragging_fnc_isObjectOnObject;
 *
 * Public: No
 */
params ["_object"];

(getPosATL _object select 2) - (getPos _object select 2) > 1E-5
