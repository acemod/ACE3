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

//reset captive animation after leaving vehicle
class Extended_GetOut_EventHandlers {
    class All {
        class GVAR(AutoDetachCaptive) {
            getOut = QUOTE(_this call FUNC(handleGetOut));
        };
    };
};

//reset captivity and escorting status when getting killed
class Extended_Killed_EventHandlers {
    class CAManBase {
        class GVAR(AutoDetachCaptive) {
            killed = QUOTE(_this call FUNC(handleKilled));
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
