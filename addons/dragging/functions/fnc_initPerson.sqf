/*
 * Author: commy2
 *
 * Initialize variables for drag or carryable persons. Called from init EH.
 *
 * Argument:
 * 0: Any Unit (Object)
 *
 * Return value:
 * NONE.
 */
#include "script_component.hpp"

private "_unit";

_unit = _this select 0;

[_unit, true/*, _position, _direction*/] call FUNC(setDraggable);
[_unit, true/*, _position, _direction*/] call FUNC(setCarryable);
