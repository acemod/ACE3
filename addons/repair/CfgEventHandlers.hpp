
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

//Need initPost or we have problems with setVariable with addSpareParts
class Extended_InitPost_EventHandlers {
    class Car {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
    class Tank {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
    class Motorcycle {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
    class Helicopter {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions));
            exclude[] = {QEGVAR(fastroping,helper), "ACE_friesBase", QEGVAR(refuel,helper)};
        };
    };
    class Plane {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
    class Ship_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };
};
