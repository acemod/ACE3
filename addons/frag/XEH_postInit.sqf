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
                "ace_interact_menu_newControllableObject",
                {
                    params ["_type"];

                    private _action = [
                        QGVAR(debugReset),
                        "Reset ACE Frag traces",
                        "",
                        {
                            remoteExecCall [QFUNC(dev_clearTraces), 2];
                        },
                        {true}
                    ] call EFUNC(interact_menu,createAction);
                    [
                        _type,
                        1,
                        ["ACE_SelfActions"],
                        _action,
                        true
                    ] call ace_interact_menu_fnc_addActionToClass;
                }
            ] call CBA_fnc_addEventHandler;
        };
        #endif
    }
] call CBA_fnc_addEventHandler;

#ifdef LOG_FRAG_INFO
[true, true, 30] call FUNC(dev_debugAmmo);
#endif
