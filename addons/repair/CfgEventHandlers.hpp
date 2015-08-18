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
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };

    class Tank {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions));
        };
    };

    class Helicopter {
        class ADDON {
            init = QUOTE(_this call DFUNC(addRepairActions));
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
    class ACE_RepairItem_Base {
        class ADDON {
            init = QUOTE(if (!isnil QUOTE(QEFUNC(cargo,initObject))) then {_this call EFUNC(cargo,initObject)});
        };
    };
};
