
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
        serverInit = QUOTE(call COMPILE_FILE(XEH_serverInit));
    };
};

class Extended_Init_EventHandlers {
    class StaticWeapon {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
    class StaticMortar {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
    class ReammoBox_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
};
