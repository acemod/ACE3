
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
    class Air {
        class ADDON {
            init = QUOTE(call FUNC(vehicleInit));
        };
    };
    class LandVehicle {
        class ADDON {
            init = QUOTE(call FUNC(vehicleInit));
        };
    };
    class Ship {
        class ADDON {
            init = QUOTE(call FUNC(vehicleInit));
        };
    };
};
class Extended_Killed_EventHandlers {
    class Air {
        class ADDON {
            Killed = QUOTE(call FUNC(handleKilled));
        };
    };
    class LandVehicle {
        class ADDON {
            Killed = QUOTE(call FUNC(handleKilled));
        };
    };
    class Ship {
        class ADDON {
            Killed = QUOTE(call FUNC(handleKilled));
        };
    };
};

/*
class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(call FUNC(validateInventory));
        };
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(call FUNC(validateInventory));
        };
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class ADDON {
            Take = QUOTE(call FUNC(validateInventory));
        };
    };
};
class Extended_Put_EventHandlers {
    class CAManBase {
        class ADDON {
            Put = QUOTE(call FUNC(validateInventory));
        };
    };
};
*/