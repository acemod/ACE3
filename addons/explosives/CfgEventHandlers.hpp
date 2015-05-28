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
class Extended_Explosion_EventHandlers {
    class ACE_DefuseObject {
        class GVAR(tripFlareEffect) {
            explosion = QUOTE(_this call FUNC(tripFlareExplosionEH));
        };
    };
};
/*
TODO: Move the addEventHandlers out of PostInit into here or separate eventHandlers,
to enable them on all units, so unit switching works for explosives properly.
class Extended_Init_EventHandlers {
class CAManBase {
init = "";
}
}
 */
