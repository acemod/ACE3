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

(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call FUNC(handleModifierKey)}];
(findDisplay 46) displayAddEventHandler ["KeyUp", {_this call FUNC(handleModifierKeyUp)}];
