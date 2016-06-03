/*
 * Author: commy2
 * Initializes the MouseZChanged eventhandler.
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

_display displayAddEventHandler ["MouseZChanged", QUOTE(_this call FUNC(handleScrollWheel))];
