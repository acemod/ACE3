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

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(call FUNC(resetStateDefault));
        };
    };
};

class Extended_Local_EventHandlers {
    class CAManBase {
        class ADDON {
            local = QUOTE(call FUNC(localityChangedEH));
            exclude[] = {"B_UAV_AI","O_UAV_AI","UAV_AI_base_F"};
        };
    };
};
