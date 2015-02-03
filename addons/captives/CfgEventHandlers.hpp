class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_postInitClient));
    };
};

//release escorted captive when entering a vehicle
class Extended_GetIn_EventHandlers {
    class All {
        class GVAR(AutoDetachCaptive) {
            getIn = "if (local (_this select 2) && {(_this select 2) getVariable ['ACE_isEscorting', false]}) then {(_this select 2) setVariable ['ACE_isEscorting', false, true]}";
        };
    };
};

//reset captive animation after leaving vehicle
class Extended_GetOut_EventHandlers {
    class All {
        class GVAR(AutoDetachCaptive) {
            getOut = QUOTE(_this call FUNC(handleGetOut));
        };
    };
};

//reset captivity and escorting status when getting killed
class Extended_Killed_EventHandlers {
    class CAManBase {
        class GVAR(AutoDetachCaptive) {
            killed = "if ((_this select 0) getVariable ['ACE_isCaptive', false]) then {(_this select 0) setVariable ['ACE_isCaptive', false, true]}; if ((_this select 0) getVariable ['ACE_isEscorting', false]) then {(_this select 0) setVariable ['ACE_isEscorting', false, true]};";
        };
    };
};

//handle captive and unconsciousness state
class Extended_Init_EventHandlers {
    class CAManBase {
        class GVAR(AutoDetachCaptive) {
            init = "_this call ACE_Captives_fnc_initUnit";
        };
    };
};

//mission start
class Extended_InitPost_EventHandlers {
    class CAManBase {
        class GVAR(InitPost) {
            init = "if (local (_this select 0)) then {_this call ACE_Captives_fnc_initPost};";
        };
    };
};

