#include "script_component.hpp"

if(isServer) then {
    [QGVAR(frag_eh), { _this call FUNC(frago); }] call ace_common_fnc_addEventHandler;
};