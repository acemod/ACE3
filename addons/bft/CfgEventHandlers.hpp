
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

/*
class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(call FUNC(validateInventory));
        };
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(call FUNC(validateInventory));
        };
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class ADDON {
            Take = QUOTE(call FUNC(validateInventory));
        };
    };
};
class Extended_Put_EventHandlers {
    class CAManBase {
        class ADDON {
            Put = QUOTE(call FUNC(validateInventory));
        };
    };
};
*/