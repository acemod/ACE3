class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit) );
    };
};

class Extended_Init_EventHandlers {
    class AllVehicles {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(vehicleInit));
        };
    };
};
