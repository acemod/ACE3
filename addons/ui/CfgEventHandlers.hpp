class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
    };
};

// Closing diary resets showHUD
class Extended_DisplayUnload_EventHandlers {
    class RscDiary {
        ADDON = QUOTE([{[false] call FUNC(setElements)}] call CBA_fnc_execNextFrame);
    };
};
