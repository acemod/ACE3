#include "script_component.hpp"
if (params ["_round"]) then {
    GVAR(blackList) set [(count GVAR(blackList)), _round];
};
