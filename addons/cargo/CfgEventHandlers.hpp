class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Killed_EventHandlers {
    class All {
        init = QUOTE(call FUNC(handleDestroyed));
    };
};

class Extended_Init_EventHandlers {
    class All {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject); _this call DFUNC(initVehicle));
        };
    };
};
