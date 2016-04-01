
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

class Extended_Hit_EventHandlers {
    class CAManBase {
        class ADDON {
            hit = QUOTE(_this call FUNC(fallDown));
        };
    };
};
