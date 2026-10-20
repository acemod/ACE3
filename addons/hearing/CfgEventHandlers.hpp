class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(call FUNC(handleRespawn));
        };
    };
};

class Extended_Killed_EventHandlers {
    class Car {
        class ADDON {
            killed = QUOTE(call FUNC(handleVehicleKilled));
        };
    };
    class Tank {
        class ADDON {
            killed = QUOTE(call FUNC(handleVehicleKilled));
        };
    };
    class Motorcycle {
        class ADDON {
            killed = QUOTE(call FUNC(handleVehicleKilled));
        };
    };
    class Helicopter {
        class ADDON {
            killed = QUOTE(call FUNC(handleVehicleKilled));
        };
    };
    class Plane {
        class ADDON {
            killed = QUOTE(call FUNC(handleVehicleKilled));
        };
    };
    class Ship_F {
        class ADDON {
            killed = QUOTE(call FUNC(handleVehicleKilled));
        };
    };
};
