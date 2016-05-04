/*
 * Author: commy2
 * Handles incremental door opening
 *
 * Arguments:
 * 0: scroll amount <NUMBER>
 *
 * Return Value:
 * handled <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_scroll"];

if !(GVAR(isOpeningDoor)) exitWith {false};

GVAR(doorTargetPhase) = ((GVAR(doorTargetPhase) + (_scroll / (1.2 * 12))) max 0) min 1;

GVAR(usedScrollWheel) = true;

true
