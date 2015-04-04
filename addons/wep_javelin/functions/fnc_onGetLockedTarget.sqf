//#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Store the current cursor target for guidance
GVAR(currentTarget) = cursorTarget;
GVAR(currentTargetPos) = screenToWorld [0.5,0.5];

TRACE_2("Tracking optics target draw", GVAR(currentTarget), GVAR(currentTargetPos));

if(isNil QGVAR(nextSoundPlay)) then {
    GVAR(nextSoundPlay) = diag_tickTime + 0.25;
};

hint format["T: %1", GVAR(currentTarget)];

if(diag_tickTime > GVAR(nextSoundPlay) ) then {
    GVAR(nextSoundPlay) = diag_tickTime + 0.25;

    if(!isNull GVAR(currentTarget)) then {
        playSound "ACE_Javelin_Locked";
    } else {
        playSound "ACE_Javelin_Locking";
    };
};
