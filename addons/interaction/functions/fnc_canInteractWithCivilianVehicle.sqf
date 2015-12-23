/*
 * Author: commy2 && dixon13
 * Checks if the unit can interact with civilian on in vehicle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 2: Target has to be on the civilian side (default: true) <BOOL>
 *
 * Return Value:
 * Able to interact with civilian <BOOL>
 *
 * Example:
 * [target] call ace_interaction_fnc_canInteractWithCivilianVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target", ["_isCivilian", true]];
alive _target && !isNull objectParent _target && [side _target != side _unit, side group _target == civilian] select _isCivilian // return
