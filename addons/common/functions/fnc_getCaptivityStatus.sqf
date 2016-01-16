/*
 * Author: commy2
 * Return the captivity status of an unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Captivity Reasons, empty if not captive <ARRAY>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

//Now just a wrapper for FUNC(statusEffect_get)

([player, "setCaptive"] call FUNC(statusEffect_get)) select 1
