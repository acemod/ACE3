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

class Extended_Killed_EventHandlers {
    class CAManBase {
        GVAR(killedHandler) = QUOTE(_this call FUNC(onIncapacitated));
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        GVAR(takeHandler) = QUOTE([ARR_3(_this select 0, _this select 1, _this select 2)] call FUNC(onInventoryChanged));
    };
};
class Extended_Put_EventHandlers {
    class CAManBase {
        GVAR(takeHandler) = QUOTE([ARR_3(_this select 1, _this select 0, _this select 2)] call FUNC(onInventoryChanged));
    };
};
