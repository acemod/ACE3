#include "script_component.hpp"
if(isServer) then {
    [QGVAR(frag_eh), { _this call FUNC(frago); }] call ace_common_fnc_addEventHandler;
};
/*
GVAR(replacedBisArtyWrapper) = false;
[] spawn {
    waitUntil {
        if(!(isNil "BIS_ARTY_F_ShellFlight")) then {
            ACE_WRAPPER_BIS_ARTY_F_ShellFlight = BIS_ARTY_F_ShellFlight;
            BIS_ARTY_F_ShellFlight = FUNC(BIS_ARTY_WRAPPER);
            GVAR(replacedBisArtyWrapper) = true;
        };
        sleep 4;
        GVAR(replacedBisArtyWrapper)
    };
};
*/