class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_preInit.sqf) );
  };
};

class Extended_PostInit_EventHandlers {
  class ADDON {
    postInit = QUOTE(call COMPILE_FILE(XEH_postInit) );
  };
};
