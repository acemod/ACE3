
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

<<<<<<< HEAD
class Extended_DisplayLoad_EventHandlers {
    class RscUnitInfo {
        ADDON = QUOTE(_this call FUNC(turretDisplayLoaded));
    };
};

=======
>>>>>>> 0f7bfc0f6654cef08f84b36fbc4fd4be2774777b
class Extended_FiredBIS_EventHandlers {
    class Mortar_01_base_F {
        class ADDON {
            firedBIS = QUOTE(_this call FUNC(handleFired));
        };
    };
};
