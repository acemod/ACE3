/*
 * Author: commy2
 *
 * Execute an animation. This is used to not break things like the unconsciousness animation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Animation <STRING>
 * 2: Priority of the animation. (default: 0) <NUMBER>
 *     0 = PlayMove
 *     1 = PlayMoveNow
 *     2 = SwitchMove (no transitional animation, doesn't overwrite priority 1)
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_animation", ["_priority", 0], ["_force", false]];

// don't overwrite more important animations
if (_unit getVariable ["ACE_isUnconscious", false] && {(_animation != "Unconscious")} && {!_force}) exitWith {};

// don't go unconscious if the unit isn't unconscious
if (_animation == "Unconscious" && {!((_unit getVariable ["ACE_isUnconscious", false]) || (_unit getVariable ["ACE_isDead", false]))}) exitWith {};

// switchMove "" no longer works in dev 1.37
if (_animation == "") then {
    _animation = [_unit] call FUNC(getDefaultAnim);
};

//if (_animation == animationState _unit) exitWith {};

switch (_priority) do {
    case 0: {
        if (_unit == vehicle _unit) then {
            [_unit, format ["{_this playMove '%1'}", _animation], _unit] call FUNC(execRemoteFnc);
        } else {
            // Execute on all machines. PlayMove and PlayMoveNow are bugged: They have no global effects when executed on remote machines inside vehicles.
            [_unit, format ["{_this playMove '%1'}", _animation]] call FUNC(execRemoteFnc);
        };
    };
    case 1: {
        if (_unit == vehicle _unit) then {
            [_unit, format ["{_this playMoveNow '%1'}", _animation], _unit] call FUNC(execRemoteFnc);
        } else {
          // Execute on all machines. PlayMove and PlayMoveNow are bugged: They have no global effects when executed on remote machines inside vehicles.
            [_unit, format ["{_this playMoveNow '%1'}", _animation]] call FUNC(execRemoteFnc);
        };
    };
    case 2: {
        // try playMoveNow first
        if (_unit == vehicle _unit) then {
            [_unit, format ["{_this playMoveNow '%1'}", _animation], _unit] call FUNC(execRemoteFnc);
        } else {
          // Execute on all machines. PlayMove and PlayMoveNow are bugged: They have no global effects when executed on remote machines inside vehicles.
            [_unit, format ["{_this playMoveNow '%1'}", _animation]] call FUNC(execRemoteFnc);
        };

        // if animation doesn't respond, do switchMove
        if (animationState _unit != _animation) then {
            // Execute on all machines. SwitchMove has local effects.
            [_unit, format ["{_this switchMove '%1'}", _animation]] call FUNC(execRemoteFnc);
        };
    };
    default {};
};
