class ACE_Medical_Injuries {
    class damageTypes {
        class woundHandlers {};
        class explosive {
            class woundHandlers: woundHandlers {};
        };
        class GVAR(toePopper): explosive {
            class woundHandlers: woundHandlers {
                ADDON = QFUNC(woundsHandlerToePopper);
            };
        };
    };
};
