
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers {
    class AllVehicles {
        class ADDON {
            serverInit = QUOTE(call FUNC(addObjectToCurator));
        };
    };
};
