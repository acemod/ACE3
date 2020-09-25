
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

class Extended_DisplayUnload_EventHandlers {
    class RscDisplayOptionsVideo {
        ADDON = QUOTE([false] call FUNC(adaptViewDistance));
    };
};
