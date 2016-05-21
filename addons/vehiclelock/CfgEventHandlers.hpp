
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

class Extended_InitPost_EventHandlers {
    class Car {
        class ADDON {
            serverInit = QUOTE(_this call FUNC(handleVehicleInitPost));
        };
    };
    class Tank {
        class ADDON {
            serverInit = QUOTE(_this call FUNC(handleVehicleInitPost));
        };
    };
    class Helicopter {
        class ADDON {
            serverInit = QUOTE(_this call FUNC(handleVehicleInitPost));
        };
    };
};
