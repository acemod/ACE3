class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE( call COMPILE_FILE(XEH_clientInit) );
    };
};

class Extended_InitPost_EventHandlers {
    class All {
        class GVAR(compileMenu) {
            init = QUOTE(_this call FUNC(compileMenu);_this call FUNC(compileMenuSelfAction));
        };
    };
};
