
class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE(call COMPILE_FILE(XEH_preInit));
  };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_Init_EventHandlers {
    class ACE_SpottingScopeObject {
        class ADDON {
            init = QUOTE(_this call DEFUNC(dragging,initObject));
        };
    };
};
