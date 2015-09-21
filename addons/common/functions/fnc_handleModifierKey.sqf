/*
 * Author: commy2
 * Handles key down event for modifier key.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public : No
 */
#include "script_component.hpp"

params ["", "", "", "_ctrl"];

if (_ctrl) then {ACE_modifier = 1};
