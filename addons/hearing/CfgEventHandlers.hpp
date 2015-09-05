class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE( call COMPILE_FILE(XEH_postInit) );
    };
};

class Extended_Init_EventHandlers {
    class CAManBase {
        class GVAR(AddEarPlugs) {
            init = QUOTE( if (local (_this select 0)) then {_this call FUNC(addEarPlugs)}; );
        };
    };
};

class Extended_FiredNear_EventHandlers {
    class AllVehicles {
        class GVAR(FiredNear) {
            clientFiredNear = QUOTE(_this call FUNC(firedNear););
        };
    };
};

class Extended_Explosion_EventHandlers {
    class CAManBase {
        class GVAR(ExplosionNear) {
            clientExplosion = QUOTE(_this call FUNC(explosionNear););
        };
    };
};
