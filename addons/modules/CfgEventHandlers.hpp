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
    class _ACE_modules { // using a _ so it is the first postInit to be executed
       init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};
