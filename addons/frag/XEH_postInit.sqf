#include "script_component.hpp"

[
    "CBA_settingsInitialized",
    {
        if (isServer) then {
            call FUNC(initBlackList);
            call FUNC(initMaterialCache);
        };

        #ifdef DEBUG_MODE_DRAW
        if (hasInterface) then {
            GVAR(dev_drawPFEH) = [
                LINKFUNC(dev_drawTrace),
                0
            ] call CBA_fnc_addPerFrameHandler;
            [
                "unit",
                LINKFUNC(dev_switchUnitHandle),
                true
            ] call CBA_fnc_addPlayerEventHandler;
        };
        #endif
    }
] call CBA_fnc_addEventHandler;


#ifdef LOG_FRAG_INFO
[true, true, 30] call FUNC(dev_debugAmmo);
#endif
