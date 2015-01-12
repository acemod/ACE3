class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_preInit.sqf) );
  };
};

class Extended_Killed_EventHandlers {
  class CAManBase {
    class GVAR(HandleGear) {
      killed = QUOTE( _this call FUNC(handleKilled) );
    };
  };
};
class Extended_Respawn_EventHandlers {
  class CAManBase {
    class GVAR(HandleGear) {
      respawn = QUOTE( _this call FUNC(handleRespawn) );
    };
  };
};
