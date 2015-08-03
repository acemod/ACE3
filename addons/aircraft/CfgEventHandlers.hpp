class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_FiredBIS_EventHandlers {
    class Plane {
        class ADDON {
            firedBIS = QUOTE(_this call FUNC(gau8_muzzleEffect));
        };
    };
};