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

class Extended_Killed_EventHandlers {
    class CAManBase {
        GVAR(killedHandler) = QUOTE(_this call FUNC(onIncapacitated));
    };
};

class Extended_Take_EventHandlers {
    class CAManBase {
        GVAR(takeHandler) = QUOTE(call FUNC(onInventoryChanged));
    };
};
class Extended_Put_EventHandlers {
    class CAManBase {
        GVAR(takeHandler) = QUOTE([ARR_3(_this select 1, _this select 0, _this select 2)] call FUNC(onInventoryChanged));
    };
};

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayMission {
        ADDON = QUOTE(_this call COMPILE_FILE(XEH_missionDisplayLoad));
    };
};

class Extended_Init_EventHandlers {
    class ACE_Explosives_Place_SLAM {
        ADDON = QUOTE(params ['_mine']; if (local _mine) then {_mine setCenterOfMass [ARR_3(0,-0.035,0.05)]; _mine setMass 5});
    };
};
