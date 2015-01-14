//#define DEBUG_MODE_FULL
#include "script_component.hpp"

// Store the current cursor target for guidance
GVAR(currentTarget) = cursorTarget;
GVAR(currentTargetPos) = screenToWorld [0.5,0.5];

TRACE_2("Tracking optics target draw", GVAR(currentTarget), GVAR(currentTargetPos));