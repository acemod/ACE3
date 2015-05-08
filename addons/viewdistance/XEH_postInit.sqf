#include "script_component.hpp"

if (!GVAR(changeAllowed)) exitWith {
    // if viewdistance module is disabled from config, exit here.
    diag_log format["[ACE]: View Distance is disabled from the config.cpp in the pbo"];
};  
[] call FUNC(initViewDistance);