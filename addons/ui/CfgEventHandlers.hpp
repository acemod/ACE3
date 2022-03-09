class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_SCRIPT(XEH_clientInit));
    };
};

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayInterrupt {
        ADDON = QUOTE([false] call FUNC(showHUDHelper));
    };
    class RscDisplayMPInterrupt {
        ADDON = QUOTE([false] call FUNC(showHUDHelper));
    };
    class RscDisplayTeamSwitch {
        ADDON = QUOTE([false] call FUNC(showHUDHelper));
    };
    class RscDisplayAAR {
        ADDON = QUOTE([false] call FUNC(showHUDHelper));
    };
};

// Closing diary resets showHUD
class Extended_DisplayUnload_EventHandlers {
    class RscDiary {
        ADDON = QUOTE([{[false] call FUNC(setElements)}] call CBA_fnc_execNextFrame);
    };
    class RscDisplayInterrupt {
        ADDON = QUOTE([true] call FUNC(showHUDHelper));
    };
    class RscDisplayMPInterrupt {
        ADDON = QUOTE([true] call FUNC(showHUDHelper));
    };
    class RscDisplayTeamSwitch {
        ADDON = QUOTE([true] call FUNC(showHUDHelper));
    };
};
