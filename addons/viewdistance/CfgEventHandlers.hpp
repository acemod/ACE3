
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

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayOptionsVideo {
        ADDON = QUOTE((_this + ['onLoad']) call FUNC(RscDisplayOptionsVideo));
    };
};

class Extended_DisplayUnload_EventHandlers {
    class RscDisplayOptionsVideo {
        ADDON = QUOTE((_this + ['onUnload']) call FUNC(RscDisplayOptionsVideo));
    };
};
