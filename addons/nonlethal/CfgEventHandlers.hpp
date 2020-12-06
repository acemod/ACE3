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

// Not sure if this is working. systemChats aren't firing for some reason.
class Extended_Dammaged_EventHandlers {
    ADDON = QUOTE(_this call FUNC(dammaged));
};
