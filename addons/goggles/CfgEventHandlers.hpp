
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
    class CAManBase {
        class ADDON {
            clientKilled = QUOTE(_this call FUNC(handleKilled));
        };
    };
};

class Extended_Explosion_EventHandlers {
    class CAManBase {
        class ADDON {
            clientExplosion = QUOTE(if (local (_this select 0)) then {_this call FUNC(handleExplosion)});
        };
    };
};
