class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE(call compile preprocessFileLineNumbers PATHTOF(XEH_preInit.sqf) );
    serverInit = QUOTE(call compile preprocessFileLineNumbers PATHTOF(scripts\readParameters.sqf) );
    disableModuload = true;
  };
};

class Extended_PostInit_EventHandlers {
  class ADDON {
    init = QUOTE(call compile preprocessFileLineNumbers PATHTOF(XEH_postInit.sqf) );
    disableModuload = true;
  };
};

class Extended_InitPost_EventHandlers {
  class All {
    class GVAR(executePersistent) {
      init = QUOTE([_this select 0] call GVAR(fnc_executePersistent) );
    };
  };
  class CAManBase {
    class GVAR(setName) {
      init = QUOTE(if (local (_this select 0)) then { _this call FUNC(setName) }; );
    };
    class AGM_Core_forceWalk {
      init = QUOTE(if (local (_this select 0)) then { _this call FUNC(applyForceWalkStatus); }; );
    };
  };
};

class Extended_Respawn_EventHandlers {
  class All {
    class GVAR(restoreVariablesJIP) {
      respawn = QUOTE(_this call GVAR(fnc_restoreVariablesJIP) );
    };
    class GVAR(setName) {
      respawn = QUOTE(_this call GVAR(fnc_setName) );
    };
  };
};