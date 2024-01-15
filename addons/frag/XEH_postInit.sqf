#include "script_component.hpp"

[
    "CBA_settingsInitialized",
    {
        if (isServer) then {
            [] call FUNC(initBlackList);
            [] call FUNC(initMaterialCache);
        };

#ifdef DEBUG_MODE_DRAW
        if (hasInterface) then {
            private _handle = [LINKFUNC(dev_drawTrace), 0] call CBA_fnc_addPerFrameHandler;
            missionNamespace setVariable [QGVAR(dev_drawPFEH), _handle];
            ["unit", LINKFUNC(dev_switchUnitHandle), true] call CBA_fnc_addPlayerEventHandler;
            [objNull, ace_player] call FUNC(dev_switchUnitHandle);
        };
#endif
    }
] call CBA_fnc_addEventHandler;


#ifdef LOG_FRAG_INFO
[true, true, 30] call FUNC(dev_debugAmmo);
#endif
