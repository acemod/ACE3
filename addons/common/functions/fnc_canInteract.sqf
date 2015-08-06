/*
 * Author: Glowbal
 *
 * Check if unit can interact with enviroment. Unit has to be awake and not be in arrested state.
 *
 * Arguments:
 * 0: Unit that try to Interact (OBJECT)
 *
 * Return Value:
 * BOOLEAN True if unit can interact with enviroment.
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

(((_unit getvariable [QGVAR(canInteract),0]) < 1) && ([_unit] call FUNC(isAwake)) && !([_unit] call FUNC(isArrested)))
