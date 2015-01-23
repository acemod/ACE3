
class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE(call COMPILE_FILE(XEH_preInit));
    serverInit = QUOTE(call COMPILE_FILE(scripts\readParameters));
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
    class GVAR(statusEffects) {
      init = QUOTE(if (local (_this select 0)) then {[ARR_3(_this select 0, SLX_XEH_MACHINE select 1, false)] call FUNC(applyStatusEffects);};);
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
      respawn = QUOTE(_this call FUNC(resetAllDefaults_F));
    };
  };
  class CAManBase {
    class GVAR(statusEffects) {
      respawn = QUOTE(if (local (_this select 0)) then {[ARR_3(_this select 0, false, true)] call FUNC(applyStatusEffects);};);
    };
  };
};
