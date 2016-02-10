
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
        disableModuload = true;
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
        disableModuload = true;
    };
};

class Extended_InitPost_EventHandlers {
    class All {
        class GVAR(executePersistent) {
            init = QUOTE([_this select 0] call FUNC(executePersistent));
        };
    };
    class CAManBase {
        class GVAR(setName) {
            init = QUOTE(if (local (_this select 0)) then {_this call FUNC(setName)};);
        };
        class GVAR(muteUnit) {
            init = QUOTE(_this call FUNC(muteUnitHandleInitPost));
        };
    };
};

class Extended_Respawn_EventHandlers {
    class All {
        class GVAR(restoreVariablesJIP) {
            respawn = QUOTE(_this call FUNC(restoreVariablesJIP));
        };
        class GVAR(setName) {
            respawn = QUOTE(_this call FUNC(setName));
        };
        class GVAR(RESETDefaults) {
            respawn = QUOTE(_this call FUNC(resetAllDefaults));
        };
        class GVAR(statusEffect) {
            respawn = QUOTE(_this call FUNC(statusEffect_respawnEH));
        };
    };
    class CAManBase {
        class GVAR(muteUnit) {
            respawn = QUOTE(_this call FUNC(muteUnitHandleRespawn));
        };
    };
};

class Extended_Local_EventHandlers {
    class All {
        class GVAR(statusEffect) {
            local = QUOTE(_this call FUNC(statusEffect_localEH));
        };
    };
};

