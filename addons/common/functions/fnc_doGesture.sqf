/*
 * Author: commy2
 * Play a gesture.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "gestureGo"] call ace_common_fnc_doGesture
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_animation", ["_priority", 0]];
TRACE_3("params",_unit,_animation,_priority);

if (!GVAR(isReloading) || {_priority > 0}) then {
    [QGVAR(playActionNow), [_unit, _animation], _unit] call CBA_fnc_targetEvent;
};
