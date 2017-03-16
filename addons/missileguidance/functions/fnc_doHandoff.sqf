// Not currently used
#include "script_component.hpp"
PARAMS_2(_target,_args);

[QGVAR(handoff), [_target, _args]] call CBA_fnc_globalEvent;
