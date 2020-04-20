
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
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayCurator {
        ADDON = QUOTE(_this call FUNC(initDisplayCurator));
    };
    class EGVAR(spectator,display) {
        ADDON = QUOTE([_this, 60014] call FUNC(initDisplaySpectator));
    };
    class RscDisplayEGSpectator {
        ADDON = QUOTE([_this, 50] call FUNC(initDisplaySpectator));
    };
};
