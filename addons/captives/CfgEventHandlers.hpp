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
//release escorted captive when entering a vehicle
class Extended_GetIn_EventHandlers {
    class All {
        class GVAR(AutoDetachCaptive) {
            getIn = QUOTE(_this call FUNC(handleGetIn));
        };
    };
};
//reset captive animation after leaving vehicle
class Extended_GetOut_EventHandlers {
    class All {
        class GVAR(AutoDetachCaptive) {
            getOut = QUOTE(_this call FUNC(handleGetOut));
        };
    };
};
//mission start
class Extended_InitPost_EventHandlers {
    class CAManBase {
        class GVAR(InitPost) {
            init = QUOTE(_this call FUNC(handleUnitInitPost));
        };
    };
};
//make sure captiveNum is reset on respawn
class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(_this call FUNC(handleRespawn));
        };
    };
};
