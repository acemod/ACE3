
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
	class Tank {
        class GVAR(registerWithExtension) {
            init = QUOTE(_this call FUNC(registerVehicleWithExtension));
        };
        class GVAR(registerVehicleDamageHandler) {
            init = QUOTE(_this call FUNC(registerVehicleDamageHandler));
        };
	};
};
/*
class Extended_Killed_EventHandlers {
    class All { 
        GVAR(unregisterWithExtension) = QUOTE(_this call FUNC(unregisterWithExtension));
    };
};*/