// This is a debug function for displaying visible lasers for ourselves
#include "script_component.hpp"

ACE_LOGINFO("Laser Emitter Dump");

{
    ACE_LOGINFO_1("  %1", _x);
    ACE_LOGINFO_1("    %1",[ARR_2(GVAR(laserEmitters),_x)] call CBA_fnc_hashGet);
} forEach (GVAR(laserEmitters) select 1);
