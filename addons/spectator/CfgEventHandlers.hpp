
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
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
    };
};

class Extended_DisplayLoad_EventHandlers {
    class RscRespawnCounter {
        ADDON = QUOTE(_this call FUNC(compat_counter));
    };
    class RscDisplayEGSpectator {
        ADDON = QUOTE(_this call FUNC(compat_spectatorBI));
    };
    class RscDisplayCurator {
        ADDON = QUOTE(_this call FUNC(compat_zeus));
    };
};
