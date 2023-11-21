
class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON    {
        init = QUOTE(call COMPILE_SCRIPT(XEH_pre_init));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_post_init));
    };
};

class Extended_FiredBIS_EventHandlers {
    class All {
        ADDON = QUOTE(_this call FUNC(onFired));
    };
};

class Extended_IncomingMissile_EventHandlers {
    class All {
        ADDON = QUOTE(_this call FUNC(onIncomingMissile));
    };
};
