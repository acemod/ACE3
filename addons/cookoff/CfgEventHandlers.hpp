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

class Extended_InitPost_EventHandlers {
    class UGV_02_Demining_Base_F {
        class ADDON {
            init = QUOTE(call FUNC(disableCookoff));
        };
    };

    class UGV_02_Science_Base_F {
        class ADDON {
            init = QUOTE(call FUNC(disableCookoff));
        };
    };
};
