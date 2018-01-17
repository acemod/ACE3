#include "script_component.hpp"
params ["_round"];
GVAR(blackList) set [(count GVAR(blackList)), _round];
