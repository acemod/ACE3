class Extended_PreInit_EventHandlers {
    class ADDON    {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
        clientInit = QUOTE(call COMPILE_FILE(XEH_preClientInit));
    };
};

class Extended_GetIn_Eventhandlers {
    class ACE_M47_Dragon_Static_Base {
        class ADDON {
            clientGetin = QUOTE(_this call FUNC(getIn));
        };
    };
};
class Extended_GetOut_Eventhandlers {
    class ACE_M47_Dragon_Static_Base {
        class ADDON {
            clientGetout = QUOTE(_this call FUNC(getOut));
        };
    };
};