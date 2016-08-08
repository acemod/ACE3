
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

class Extended_Killed_EventHandlers {
    class All {
        class ADDON {
            serverKilled = QUOTE(call FUNC(handleDestroyed));
        };
    };
};

//Need initPost or we have problems with setVariable with 'ACE_Cargo'
class Extended_InitPost_EventHandlers {
    class ThingX {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject); _this call DFUNC(initVehicle));
        };
    };
    class Land_PaperBox_closed_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject); _this call DFUNC(initVehicle));
        };
    };
    class PlasticCase_01_base_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject); _this call DFUNC(initVehicle));
        };
    };
    class LandVehicle {
        class ADDON {
            init = QUOTE(_this call DFUNC(initVehicle));
        };
    };
    class Air {
        class ADDON {
            init = QUOTE(_this call DFUNC(initVehicle));
        };
    };
    class Ship_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initVehicle));
        };
    };
    class ACE_ConcertinaWireCoil {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
    class Land_PortableLight_single_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
    class StaticWeapon {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
};
