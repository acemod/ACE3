#include "script_component.hpp"
PARAMS_2(_target,_args);

if(isNil "_target" || {isNull _target} || {!local _target} ) exitWith { false };

[FUNC(guidancePFH), 0, _args] call cba_fnc_addPerFrameHandler;