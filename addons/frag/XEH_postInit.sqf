#include "script_component.hpp"

[
    "CBA_settingsInitialized",
    {
        ["ace_firedPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
        ["ace_firedNonPlayer", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
        ["ace_firedPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
        ["ace_firedNonPlayerVehicle", LINKFUNC(fired)] call CBA_fnc_addEventHandler;
#ifdef DEBUG_MODE_DRAW
        [QGVAR(dev_clearTraces), LINKFUNC(dev_clearTraces)] call CBA_fnc_addEventHandler;

        if (!hasInterface) exitWith {};
        ["ace_firedPlayerVehicleNonLocal", LINKFUNC(dev_fired)] call CBA_fnc_addEventHandler;
        ["ace_firedNonPlayerVehicle", LINKFUNC(dev_fired)] call CBA_fnc_addEventHandler;
        GVAR(dev_drawPFEH) = [LINKFUNC(dev_drawTrace), 0] call CBA_fnc_addPerFrameHandler;
        [
            "ace_interact_menu_newControllableObject",
            {
                params ["_type"];

                private _action = [
                    QGVAR(debugReset),
                    "Reset ACE Frag traces",
                    "",
                    {
                        [QGVAR(dev_clearTraces), []] call CBA_fnc_globalEvent;
                    },
                    {GVAR(dev_trackLines) isNotEqualTo createHashMap}
                ] call EFUNC(interact_menu,createAction);
                [
                    _type,
                    1,
                    ["ACE_SelfActions"],
                    _action,
                    true
                ] call EFUNC(interact_menu,addActionToClass);
            }
        ] call CBA_fnc_addEventHandler;
#endif
    }
] call CBA_fnc_addEventHandler;

#ifdef LOG_FRAG_INFO
[true, true, 30] call FUNC(dev_debugAmmo);
#endif
