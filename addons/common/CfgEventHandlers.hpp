
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

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayMission {
        ADDON = QUOTE(call COMPILE_SCRIPT(XEH_missionDisplayLoad));
    };
    class RscUnitInfo {
        ADDON = QUOTE([ARR_2('ace_infoDisplayChanged',[ARR_2(_this select 0,'Any')])] call CBA_fnc_localEvent;);
    };
};

class Extended_InitPost_EventHandlers {
    class CAManBase {
        class GVAR(setName) {
            init = QUOTE(if (local (_this select 0)) then {[ARR_2(FUNC(setName),_this)] call CBA_fnc_execNextFrame};);
        };
        class GVAR(muteUnit) {
            init = QUOTE(call FUNC(muteUnitHandleInitPost));
        };
    };
};

class Extended_Respawn_EventHandlers {
    class All {
        class GVAR(restoreVariablesJIP) {
            respawn = QUOTE(call FUNC(restoreVariablesJIP));
        };
        class GVAR(setName) {
            respawn = QUOTE(call FUNC(setName));
        };
        class GVAR(RESETDefaults) {
            respawn = QUOTE(call FUNC(resetAllDefaults));
        };
        class GVAR(statusEffect) {
            respawn = QUOTE(call FUNC(statusEffect_respawnEH));
        };
    };
    class CAManBase {
        class GVAR(muteUnit) {
            respawn = QUOTE(call FUNC(muteUnitHandleRespawn));
        };
    };
};

class Extended_Local_EventHandlers {
    class All {
        class GVAR(statusEffect) {
            local = QUOTE(call FUNC(statusEffect_localEH));
        };
    };
};

class Extended_FiredBIS_EventHandlers {
    class All {
        ADDON = QUOTE(call FUNC(firedEH));
    };
};

class Extended_Engine_EventHandlers {
    class All {
        ADDON = QUOTE(call FUNC(handleEngine));
    };
};
