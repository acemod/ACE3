
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
        clientInit = QUOTE(call COMPILE_SCRIPT(XEH_clientInit));
    };
};
class Extended_GetIn_EventHandlers {
    class All {
        class ADDON {
            getIn = QUOTE(_this call FUNC(handleGetIn));
        };
    };
};
class Extended_GetOut_EventHandlers {
    class All {
        class ADDON {
            getOut = QUOTE(_this call FUNC(handleGetOut));
        };
    };
};
class Extended_Killed_EventHandlers {
    class All {
        class ADDON {
            killed = QUOTE(_this call FUNC(handleKilled));
        };
    };
};
