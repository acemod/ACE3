
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

class Extended_DisplayUnload_EventHandlers {
    class RscDisplayCurator {
        ADDON = QUOTE(call FUNC(handleZeusDisplayChanged));
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

class Extended_Local_EventHandlers {
    class CAManBase {
        class ADDON {
            local = QUOTE(call FUNC(handleLocal));
        };
    };
};

class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(_this call FUNC(handleKilled));
        };
    };
};
