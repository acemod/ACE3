/*
 * Author: jaynus
 * PFEH to set all Ace Time Variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

BEGIN_COUNTER(timePFH);

local _lastTickTime = ACE_diagTime;
local _lastGameTime = ACE_gameTime;

ACE_gameTime = time;
ACE_diagTime = diag_tickTime;

local _delta = ACE_diagTime - _lastTickTime;

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

END_COUNTER(timePFH);
