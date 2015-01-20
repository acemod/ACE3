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


class Extended_Killed_Eventhandlers {
    class CaManBase {
        class ADDON {
            Killed =  QUOTE(_this call FUNC(eh_killed));
        };
    };
};

class Extended_Local_Eventhandlers {
    class CaManBase {
        class ADDON    {
            Local = QUOTE(_this call FUNC(eh_local));
        };
    };
};
class Extended_Init_Eventhandlers {
    class CaManBase {
        class ADDON    {
            init = QUOTE(_this call FUNC(onInitForUnit););
        };
    };
};
