class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_FiredBIS_EventHandlers {
    class All {
        class ADDON {
            clientFiredBIS = QUOTE(if ((GVAR(enablePlayerSuppression) && hasInterface)) then {_this call FUNC(fired)});
        };
    };
};
