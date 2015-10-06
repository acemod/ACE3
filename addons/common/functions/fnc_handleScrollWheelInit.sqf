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

(findDisplay 46) displayAddEventHandler ["MouseZChanged", QUOTE(_this call FUNC(handleScrollWheel))];
