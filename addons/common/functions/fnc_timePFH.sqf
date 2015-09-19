/*
 * Author: ?
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: ?
 */
#include "script_component.hpp"

private ["_lastTickTime", "_lastGameTime", "_delta"];

_lastTickTime = ACE_diagTime;
_lastGameTime = ACE_gameTime;

ACE_gameTime = time;
ACE_diagTime = diag_tickTime;

_delta = ACE_diagTime - _lastTickTime;
if (ACE_gameTime <= _lastGameTime) then {
    TRACE_1("paused",_delta);
    ACE_paused = true;
    // Game is paused or not running
    ACE_pausedTime = ACE_pausedTime + _delta;
    ACE_virtualPausedTime = ACE_pausedTime + (_delta * accTime);
} else {
    TRACE_1("live",_delta);
    ACE_paused = false;
    // Time is updating
    ACE_realTime = ACE_realTime + _delta;
    ACE_virtualTime = ACE_virtualTime + (_delta * accTime);
    ACE_time = ACE_virtualTime;
};
