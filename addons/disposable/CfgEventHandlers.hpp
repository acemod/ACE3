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

class Extended_FiredBIS_EventHandlers {
    class CAManBase {
        class ADDON {
            firedBIS = QUOTE(_this call FUNC(replaceATWeapon));
        };
    };
};

// handle preloaded missile
class Extended_InitPost_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE([_this select 0] call FUNC(takeLoadedATWeapon));
        };
    };
};
