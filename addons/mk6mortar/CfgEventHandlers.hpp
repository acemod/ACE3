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
class Extended_FiredBIS_EventHandlers {
    class Mortar_01_base_F {
        class ADDON {
            firedBIS = QUOTE(_this call FUNC(handleFired));
        };
    };
};
class Extended_InitPost_EventHandlers {
    class Mortar_01_base_F {
        class ADDON {
            init = QUOTE(_this call COMPILE_FILE(XEH_initPost));
        };
    };
};
class Extended_GetIn_EventHandlers {
    class Mortar_01_base_F {
        class ADDON {
            getIn = QUOTE(_this call COMPILE_FILE(XEH_getIn));
        };
    };
};
