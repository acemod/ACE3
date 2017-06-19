
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

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayInventory {
        ADDON = QUOTE([ARR_2(ACE_player, _this select 0)] call FUNC(updateInventoryDisplay));
    };
};

// handle preloaded missile
class Extended_InitPost_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE([_this select 0] call FUNC(takeLoadedATWeapon));
        };
    };
};
