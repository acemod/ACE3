
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
<<<<<<< HEAD

class Extended_DisplayLoad_EventHandlers {
    class RscDiary {
        ADDON = QUOTE(call COMPILE_FILE(XEH_displayLoad));
    };
};
=======
>>>>>>> 0f7bfc0f6654cef08f84b36fbc4fd4be2774777b
