/*
 * Author: Glowbal
 *
 * Check if unit is in arrested state
 *
 * Arguments:
 * 0: Unit (OBJECT)
 *
 * Return Value:
 * if unit or object is in arrest state (BOOLEAN)
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

(_unit getvariable [QGVAR(StateArrested),false])
