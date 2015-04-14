class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Fired_EventHandlers {
    class All {
        class ADDON {
            clientFired = QUOTE(if ((GVAR(enablePlayerSuppression) && !isDedicated)) then {_this call FUNC(fired)});
        };
    };
};
