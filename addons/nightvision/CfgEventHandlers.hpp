
class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_postInitClient));
    };
};

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayCurator {
        ADDON = QUOTE(_this call FUNC(updatePPEffects));
    };
};

class Extended_DisplayUnload_EventHandlers {
    class RscDisplayCurator {
        ADDON = QUOTE(displayNull call FUNC(updatePPEffects)); // emulate zeus display being deleted
    };
};
