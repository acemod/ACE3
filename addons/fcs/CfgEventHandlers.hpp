class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
    };
};

class Extended_Init_EventHandlers {
    class Tank {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(vehicleInit));
        };
    };
    class Car {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(vehicleInit));
        };
    };
    class Helicopter {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(vehicleInit));
        };
    };
    class Plane {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(vehicleInit));
        };
    };
    class Ship_F {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(vehicleInit));
        };
    };
};

class Extended_FiredBIS_EventHandlers {
    class Tank {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(firedEH));
        };
    };
    class Car {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(firedEH));
        };
    };
    class Helicopter {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(firedEH));
        };
    };
    class Plane {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(firedEH));
        };
    };
    class Ship_F {
        class ADDON {
            clientInit = QUOTE(_this call FUNC(firedEH));
        };
    };
};
