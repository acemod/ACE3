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

params ["_unit", "_animation"];
TRACE_4("params",_unit,_animation);

if (!GVAR(isReloading)) then {
    [QGVAR(playActionNow), [_unit, _animation], _unit] call CBA_fnc_targetEvent;
};
