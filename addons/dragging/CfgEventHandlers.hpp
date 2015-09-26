
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

class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(_this call DFUNC(initPerson));
        };
    };
    class StaticWeapon {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
    class ReammoBox_F {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
    class ACE_RepairItem_Base {
        class ADDON {
            init = QUOTE(_this call DFUNC(initObject));
        };
    };
};

class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(_this call DFUNC(handleKilled));
        };
    };
};

class Extended_AnimChanged_EventHandlers {
    class CAManBase {
        class ADDON {
            animChanged = QUOTE(_this call DFUNC(handleAnimChanged));
        };
    };
};
