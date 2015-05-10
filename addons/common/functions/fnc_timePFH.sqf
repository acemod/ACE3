//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_lastTime", "_lastRealTime", "_lastVirtualTime", "_lastGameTime", "_delta"];

_lastTime = ACE_time;
_lastRealTime = ACE_realTime;
_lastVirtualTime = ACE_virtualTime;
_lastGameTime = ACE_gameTime;
_lastPausedTime = ACE_pausedTime;
_lastVirtualPausedTime = ACE_virtualPausedTime;

ACE_gameTime = time;
ACE_realTime = diag_tickTime;

_delta = ACE_realTime - _lastRealTime;
if(time <= _lastGameTime) then {
    // Game is paused or not running
    ACE_pausedTime = ACE_pausedTime + _delta;
    ACE_virtualPausedTime = ACE_pausedTime + (_delta * accTime);
} else {
    // Time is updating
    ACE_virtualTime = _lastVirtualTime + (_delta * accTime);
    ACE_time = ACE_realTime + _delta;
};

