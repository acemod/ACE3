class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE( call COMPILE_FILE(XEH_postInitClient) );
    };
};

class Extended_FiredBIS_EventHandlers {
    class CAManBase {
        class ADDON {
            firedBIS = QUOTE( _this call FUNC(replaceATWeapon) );
        };
    };
};

// handle preloaded missile
class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE( _this call FUNC(takeLoadedATWeapon) );
        };
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        class ADDON {
            take = QUOTE( _this call FUNC(takeLoadedATWeapon);  [_this select 0] call FUNC(updateInventoryDisplay); );
        };
    };
};

class Extended_Put_EventHandlers {
    class CAManBase {
        class ADDON {
            put = QUOTE( [_this select 0] call FUNC(updateInventoryDisplay); );
        };
    };
};
