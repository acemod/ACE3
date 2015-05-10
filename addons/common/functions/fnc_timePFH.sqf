//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_lastTime", "_lastRealTime", "_lastVirtualTime", "_lastGameTime", "_delta"];

_lastRealTime = ACE_realTime;
_lastGameTime = ACE_gameTime;

ACE_gameTime = time;
ACE_realTime = diag_tickTime;

_delta = ACE_realTime - _lastRealTime;
if(ACE_gameTime <= _lastGameTime) then {
    ACE_paused = true;
    // Game is paused or not running
    ACE_pausedTime = ACE_pausedTime + _delta;
    ACE_virtualPausedTime = ACE_pausedTime + (_delta * accTime);
} else {
    ACE_paused = false;
    // Time is updating
    ACE_virtualTime = ACE_virtualTime + (_delta * accTime);
    ACE_time = ACE_time + _delta;
};

