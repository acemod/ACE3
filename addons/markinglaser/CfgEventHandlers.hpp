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

class Extended_InitPost_EventHandlers {
    class Air {
        class ADDON {
            init = QUOTE(call FUNC(onAircraftInit));
            exclude[] = {"ParachuteBase", QEGVAR(fastroping,helper), "ACE_friesBase", QEGVAR(refuel,helper)};
        };
    };
};
