// This is a debug function for displaying visible lasers for ourselves
#include "script_component.hpp"

ACE_LOGINFO("Laser Emitter Dump");

{
    ACE_LOGINFO(format["  %1", _x]);
    ACE_LOGINFO(format["    %2", HASH_GET(GVAR(laserEmitters), _x)]);
} forEach GVAR(laserEmitters) select 0;
