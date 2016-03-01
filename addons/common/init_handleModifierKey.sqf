/*
 * Author: commy2
 * Initializes the modifier key handler.
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

disableSerialization;

params ["_display"];

_display displayAddEventHandler ["KeyDown", FUNC(handleModifierKey)];
_display displayAddEventHandler ["KeyUp", FUNC(handleModifierKeyUp)];
