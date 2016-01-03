
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
            killed = QUOTE(_this call FUNC(handleKilled));
        };
    };
};

class Extended_Fired_EventHandlers {
    class CAManBase {
        class ADDON {
            fired = QUOTE(if (local (_this select 0)) then {_this call FUNC(handleFired)});
        };
    };
};

class Extended_Explosion_EventHandlers {
    class CAManBase {
        class ADDON {
            explosion = QUOTE(if (local (_this select 0)) then {_this call FUNC(handleExplosion)});
        };
    };
};
