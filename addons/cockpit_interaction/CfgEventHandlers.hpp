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

class Extended_Init_EventHandlers {
    class Air {
        class ADDON {
            init = QUOTE([ARR_2(_this select 0,local (_this select 0))] call FUNC(onLocal));
        };
    };
};

class Extended_Engine_EventHandlers {
    class Air {
        class ADDON {
            engine = QUOTE(_this call FUNC(onEngine));
        };
    };
};

class Extended_Local_EventHandlers {
    class Air {
        class ADDON {
            local = QUOTE(_this call FUNC(onLocal));
        };
    };
};
