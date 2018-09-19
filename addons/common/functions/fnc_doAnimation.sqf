#include "script_component.hpp"
/*
 * Author: commy2
 * Execute an animation. This is used to not break things like the unconsciousness animation.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Animation <STRING>
 * 2: Priority of the animation. (default: 0) <NUMBER>
 *     0 = PlayMove
 *     1 = PlayMoveNow
 *     2 = SwitchMove (no transitional animation, doesn't overwrite priority 1)
 * 3: Force overwritting unconscious (default: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "AmovPercMstpSnonWnonDnon_exerciseKata", 1] call ace_common_fnc_doAnimation
 *
 * Public: Yes
 */

params ["_unit", "_animation", ["_priority", 0], ["_force", false]];
TRACE_4("params",_unit,_animation,_priority,_force);

// don't overwrite more important animations
if (_unit getVariable ["ACE_isUnconscious", false] && {(_animation != "Unconscious")} && {!_force}) exitWith {};

// don't go unconscious if the unit isn't unconscious
if (_animation == "Unconscious" && {!((_unit getVariable ["ACE_isUnconscious", false]) || (_unit getVariable ["ACE_isDead", false]))}) exitWith {};

// switchMove "" no longer works in dev 1.37
if (_animation == "") then {
    _animation = [_unit] call FUNC(getDefaultAnim);
};

//if (_animation == animationState _unit) exitWith {};

TRACE_2("",local _unit,vehicle _unit);
switch (_priority) do {
    case 0: {
        if (_unit == vehicle _unit) then {
            [QGVAR(playMove), [_unit, _animation], _unit] call CBA_fnc_targetEvent;
        } else {
            // Execute on all machines. PlayMove and PlayMoveNow are bugged: They have no global effects when executed on remote machines inside vehicles.
            [QGVAR(playMove), [_unit, _animation]] call CBA_fnc_globalEvent;
        };
    };
    case 1: {
        if (_unit == vehicle _unit) then {
            [QGVAR(playMoveNow), [_unit, _animation], _unit] call CBA_fnc_targetEvent;
        } else {
            // Execute on all machines. PlayMove and PlayMoveNow are bugged: They have no global effects when executed on remote machines inside vehicles.
            [QGVAR(playMoveNow), [_unit, _animation]] call CBA_fnc_globalEvent;
        };
    };
    case 2: {
        // try playMoveNow first
        if (_unit == vehicle _unit) then {
            [QGVAR(playMoveNow), [_unit, _animation], _unit] call CBA_fnc_targetEvent;
        } else {
            // Execute on all machines. PlayMove and PlayMoveNow are bugged: They have no global effects when executed on remote machines inside vehicles.
            [QGVAR(playMoveNow), [_unit, _animation]] call CBA_fnc_globalEvent;
        };

        // if animation doesn't respond, do switchMove
        if (animationState _unit != _animation) then {
            TRACE_1("did not respond to playMoveNow",animationState _unit);
            // Execute on all machines. SwitchMove has local effects.
            [QGVAR(switchMove), [_unit, _animation]] call CBA_fnc_globalEvent;
        };
    };
    default {};
};
