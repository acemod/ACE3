// This is a debug function for displaying visible lasers for ourselves
#include "script_component.hpp"

diag_log text format["[ACE]: Laser Emitter Dump"];

{ 
    diag_log text format["  %1", _x];
    diag_log text format["    %2", HASH_GET(GVAR(laserEmitters), _x)];  
} forEach GVAR(laserEmitters) select 0;