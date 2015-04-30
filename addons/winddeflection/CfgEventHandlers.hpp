class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_FiredBIS_EventHandlers {
    class AllVehicles {
        class ADDON {
            firedBIS = QUOTE(_this call FUNC(handleFired));
        };
    };
};
