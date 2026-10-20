class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
    };
};

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayInventory {
        ADDON = QUOTE(call FUNC(inventoryDisplayLoad));
        GVAR(displayNameWeight) = QUOTE(call FUNC(displayNameWeight)); // separate to allow other mods to disable them individually
    };
};

class Extended_DisplayUnload_EventHandlers {
    class RscDisplayInventory {
        ADDON = QUOTE(GVAR(unit) = ACE_player);
    };
};
