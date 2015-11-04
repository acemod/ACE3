class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_postInit) );
    };
};

class Extended_Init_EventHandlers {
    class ACE_155_M982_Pallet_F {
        class ADDON {
            init = QUOTE(_this call EFUNC(dragging,initObject));
        };
    };
    class ACE_155_M982_F {
        class ADDON {
            init = QUOTE(_this call EFUNC(dragging,initObject));
        };
    };
};