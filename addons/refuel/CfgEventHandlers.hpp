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

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(call DFUNC(handleRespawn));
        };
    };
};

class Extended_InitPost_EventHandlers {
    class Land_CanisterFuel_F {
        class ADDON {
            init = QUOTE(call DFUNC(makeJerryCan));
        };
    };
};
