
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_FiredBIS_EventHandlers {
    class CAManBase {
        class GVAR(ThrowGrenade) {
            clientFiredBIS = QUOTE(if (_this select 0 == ACE_player) then {_this call FUNC(throwGrenade)};);
        };
    };
};
