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

class Extended_Killed_EventHandlers {
    class All {
        init = QUOTE(call FUNC(handleDestroyed));
    };
};

class Extended_Init_EventHandlers {
    class StaticWeapon {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };

    class ReammoBox_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };

    class Cargo_base_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject); _this call DFUNC(initVehicle));
        };
    };

    class CargoNet_01_box_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject); _this call DFUNC(initVehicle));
        };
    };

    class Land_CargoBox_V1_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject); _this call DFUNC(initVehicle));
        };
    };

    class Land_PaperBox_closed_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject); _this call DFUNC(initVehicle));
        };
    };

    class Car {
        class ADDON {
            init = QUOTE(_this call DFUNC(initVehicle));
        };
    };

    class Tank {
        class ADDON {
            init = QUOTE(_this call DFUNC(initVehicle));
        };
    };

    class Helicopter {
        class ADDON {
            init = QUOTE(_this call DFUNC(initVehicle));
        };
    };

    class Plane {
        class ADDON {
            init = QUOTE(_this call DFUNC(initVehicle));
        };
    };

    class Ship_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initVehicle));
        };
    };

    class ACE_RepairItem_Base {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };

    class ACE_bodyBagObject {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };

    class ACE_ConcertinaWireCoil {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
};
