class Extended_PostInit_EventHandlers {
  class ADDON {
    clientInit = QUOTE(call COMPILE_FILE(XEH_post_initClient));
    serverInit = QUOTE(call COMPILE_FILE(XEH_post_initServer));
  };
};