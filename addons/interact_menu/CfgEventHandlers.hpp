
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

class Extended_InitPost_EventHandlers {
    class All {
        class GVAR(compileMenu) {
            init = QUOTE(_this call FUNC(compileMenu);_this call FUNC(compileMenuSelfAction));
        };
    };
};

class Extended_DisplayLoad_EventHandlers {
    class RscDiary {
        ADDON = QUOTE(call COMPILE_FILE(XEH_displayLoad));
    };
    class RscDisplayInterrupt {
        ADDON = QUOTE(_this call FUNC(handleEscapeMenu));
    };
    class RscDisplayMPInterrupt {
        ADDON = QUOTE(_this call FUNC(handleEscapeMenu));
    };
};
