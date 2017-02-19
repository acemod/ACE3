#include "script_component.hpp"

// THIS FUNCTION SHOULD NOT BE USED BECAUSE IT CAUSES AN SEARCH AND REBUILD

params ["_round"];

if (_round in GVAR(blackList)) then {
    REM(GVAR(blackList),_round);
};

REM(GVAR(objects),_round);
