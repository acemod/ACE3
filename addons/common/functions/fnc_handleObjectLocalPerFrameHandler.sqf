#include "script_component.hpp"

private["_wrapperArgs", "_unit", "_function"];
_wrapperArgs = _this select (count _this);
_unit = _wrapperArgs select 0;

if(local _unit) then {
    [FUNC(objectLocalPFH), (_wrapperArgs select 1), _this] call CBA_fnc_addPerFrameHandler; 
} else {
    if(isServer) then {
        // Find the owner and forward it
        ["ACE_olpfh", _unit, _args] call FUNC(targetEvent);
    } else {
        ["ACE_olpfh", _args] call FUNC(serverEvent);
    };
};
