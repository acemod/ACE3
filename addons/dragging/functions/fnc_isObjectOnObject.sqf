/*
 * Author: commy2
 * Check if Object is Overlapping
 *
 * Argument:
 * 0: Object <OBJECT>
 *
 * Return value:
 * <BOOL>
 *
 * Example;
 * [player] call ace_dragging_fnc_isObjectOnObject
 *
 * Public: No
 */
params ["_object"];

(getPosATL _object select 2) - (getPos _object select 2) > 1E-5
