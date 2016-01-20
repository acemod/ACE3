
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

class Extended_FiredBIS_EventHandlers {
    class CAManBase {
        class GVAR(throwGrenade) {
            clientFiredBIS = QUOTE(if (_this select 0 == ACE_player) then {_this call FUNC(throwGrenade)});
        };
    };
};
