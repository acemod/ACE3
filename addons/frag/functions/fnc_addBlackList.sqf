#include "script_component.hpp"
private ["_round"];
_round = _this select 0;
GVAR(blackList) set[(count GVAR(blackList)), _round];