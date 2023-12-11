
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

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayMain {
        GVAR(loadMainMenuBox) = QUOTE(_this call COMPILE_SCRIPT(init_loadMainMenuBox));
    };
};
