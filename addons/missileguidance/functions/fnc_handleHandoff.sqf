#include "script_component.hpp"
PARAMS_2(_target,_args);

if(!local _target) exitWith {};

[FUNC(guidancePFH), 0, _args] call cba_fnc_addPerFrameHandler;