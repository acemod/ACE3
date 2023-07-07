class ACE_Medical_Injuries {
    class damageTypes {
        class woundHandlers;

        class explosive {
            class woundHandlers: woundHandlers {};
        };
        class GVAR(explosive_incendiary): explosive {
            class woundHandlers: woundHandlers {
                // TODO use function name after bug with the woundHandlers config caching is fixed
                ADDON = QUOTE({call FUNC(woundsHandlerIncendiary)});
            };
        };
    };
};
