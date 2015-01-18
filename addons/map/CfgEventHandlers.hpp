class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call COMPILE_FILE(XEH_preInit) );
    serverInit = QUOTE( call COMPILE_FILE(XEH_preInitServer) );
  };
};

class Extended_PostInit_EventHandlers {
  class ADDON {
    clientInit = QUOTE( call COMPILE_FILE(XEH_postInitClient) );
  };
};
