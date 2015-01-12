class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_preInit.sqf) );
  };
};

class Extended_PostInit_EventHandlers {
  class ADDON {
    clientInit = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_clientInit.sqf) );
  };
};

class Extended_Init_EventHandlers {
  class AllVehicles {
    class ADDON {
      clientInit = QUOTE(_this call FUNC(vehicleInit));
    };
  };
};
