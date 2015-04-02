class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_pre_init));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_post_init));
    };
};

class Extended_GetIn_EventHandlers {
    class B_Heli_Attack_01_F {
        class ADDON {
            getIn = QUOTE(_this call FUNC(onGetin));
        };
    };
};

class Extended_GetOut_EventHandlers {
    class B_Heli_Attack_01_F {
        class ADDON {
            getOut = QUOTE(_this call FUNC(onGetout));
        };
    };
};
