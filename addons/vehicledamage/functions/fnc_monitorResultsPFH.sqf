//#define DEBUG_MODE_FULL
#include "script_component.hpp"
// params not used here to prevent debug spam
_args = _this select 0;
_handle = _this select 1;
private["_result"];

if(GVAR(ready)) then {
    _result = "fetch_result:1" call FUNC(callExtension);;
    while { _result != "" && {_result != "-1"} } do {
        TRACE_1("", _result);
        
        _resultArgs = [_result] call FUNC(parseResult);
        if(!isNil "_resultArgs") then {
            if((_resultArgs select 0) == "exec") then {
                TRACE_1("", "Dispatching exec");
                [] call (_resultArgs select 1);
            } else {
                _event = format["ace_vehicledamage_%1", (_resultArgs select 0)];
                TRACE_3("Dispatch command", _event, (_resultArgs select 0), (_resultArgs select 1));
                [_event, (_resultArgs select 1)] call EFUNC(common,localEvent);
            };
        };
        // Pull next result
        _result = "fetch_result:1" call FUNC(callExtension);
    };
};