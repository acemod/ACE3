
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

class Extended_InventoryOpened_EventHandlers {
    class CAManBase {
        class GVAR(onOpenInventory) {
            clientInventoryOpened = QUOTE(if (_this select 0 == ACE_player) then {_this call FUNC(onOpenInventory)};);
        };
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(_this call FUNC(handleRespawn));
        };
    };
};
