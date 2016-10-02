// This is a debug function for displaying visible lasers for ourselves
#include "script_component.hpp"

INFO("Laser Emitter Dump");

{
    INFO_1("  %1", _x);
    INFO_1("    %1",[ARR_2(GVAR(laserEmitters),_x)] call CBA_fnc_hashGet);
} forEach (GVAR(laserEmitters) select 1);
