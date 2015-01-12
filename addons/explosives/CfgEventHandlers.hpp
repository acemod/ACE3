class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_preInit.sqf) );
  };
};
class Extended_PostInit_EventHandlers {
  class ADDON {
    init = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_postInit.sqf) );
  };
};

/*
TODO: Move the addEventHandlers out of PostInit into here or separate eventHandlers,
    to enable them on all units, so unit switching works for explosives properly.
class Extended_Init_EventHandlers {
  class CAManBase {
    init = "";
  }
}
*/
