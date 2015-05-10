#include "script_component.hpp"

private["_wrapperArgs", "_unit", "_function"];
PARAMS_1(_args);
_wrapperArgs = _args select (count _args);
_unit = _wrapperArgs select 0;
_function = _wrapperArgs select (count _wrapperArgs);

if((typeName _function) == "STRING") then {
    _function = compile preprocessFileLineNumbers format["_this call %1" + _function];
    _wrapperArgs pushBack _function;
};

if(local _unit) then {
    _args call _function;
} else {
    // Clear our cached function from the arguments before passing
    _wrapperArgs deleteAt (count _wrapperArgs);
    
    // Pass off execution to the owner
    ["ACE_olpfh", _args] call FUNC(serverEvent);
};