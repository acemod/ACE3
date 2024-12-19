class ACE_Medical_Injuries {
    class damageTypes {
        class woundHandlers;

        class explosive {
            class woundHandlers: woundHandlers {};
        };
        class GVAR(explosive_incendiary): explosive {
            class woundHandlers: woundHandlers {
                ADDON = QFUNC(woundsHandlerIncendiary);
            };
        };
    };
};
