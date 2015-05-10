//#define DEBUG_MODE_FULL
#include "script_component.hpp"
PARAMS_2(_args,_handle);
private["_result"];

_result = "fetch_result:1" call FUNC(callExtension);;
while { _result != "" && {_result != "-1"} } do {
    TRACE_1("", _result);
    _result = "fetch_result:1" call FUNC(callExtension);;
    
    _resultArgs = [_result] call FUNC(parseResult);
    if(!isNil "_resultArgs") then {
        if((_resultArgs select 0) == "exec") then {
            [] call (_resultArgs select 1);
        } else {
            [format["ace_vehicledamage_%1", (_result select 0)], (_result select 1)] call EFUNC(common,localEvent);
        };
    };
};