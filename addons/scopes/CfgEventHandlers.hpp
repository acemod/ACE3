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

class Extended_Fired_EventHandlers {
    class CAManBase {
        class ADDON {
            fired = QUOTE(_this call FUNC(firedEH););
        };
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class ADDON {
            clientTake = QUOTE(if (_this select 0 == ACE_player) then{ _this call FUNC(inventoryCheck);};);
        };
    };
};

class Extended_Put_EventHandlers {
    class CAManBase {
        class ADDON {
            clientPut = QUOTE(if (_this select 0 == ACE_player) then {_this call FUNC(inventoryCheck);};);
        };
    };
};

class Extended_InitPost_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(if (_this select 0 == call EFUNC(common,player)) then{ _this call FUNC(inventoryCheck);};);
        };
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(if (_this select 0 == call EFUNC(common,player)) then{ _this call FUNC(inventoryCheck);};);
        };
    };
};
