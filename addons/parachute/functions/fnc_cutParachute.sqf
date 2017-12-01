/*
 * Author: joko // Jonas
 * Perform the cut parachute action (move unit out and delete)
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call FUNC(cutParachute);
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// Mark the cut parachute action unavailable since reserve is now in use
SETVAR(_unit,GVAR(canCut),false);

// Move unit out and delete parachute
private _vehicle = vehicle _unit;
_unit action ["GetOut", _vehicle];
deleteVehicle _vehicle;
