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

class Extended_Init_EventHandlers {
    class Car {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions); _this call DFUNC(addSpareParts));
        };
    };

    class Tank {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions); _this call DFUNC(addSpareParts));
        };
    };

    class Helicopter {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions); _this call DFUNC(addSpareParts));
        };
    };

    class Plane {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions); _this call DFUNC(addSpareParts));
        };
    };

    class Ship_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions); _this call DFUNC(addSpareParts));
        };
    };
};
