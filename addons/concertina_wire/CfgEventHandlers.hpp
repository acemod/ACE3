
class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
  class ADDON {
    init = QUOTE( call COMPILE_FILE(XEH_preInit) );
  };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE( call COMPILE_FILE(XEH_postInit) );
    };
};

class Extended_Killed_EventHandlers {
    // TODO: Probably needs handledamage eh for better tracking what killed the wire
    // Also disallow wire becoming destroyed by small explosives e.g. 40mm
    class ACE_ConcertinaWire {
        class ADDON {
            killed = QUOTE(call FUNC(handleKilled));
        };
    };
    class Land_Razorwire_F {
        class ADDON {
            killed = QUOTE(call FUNC(handleKilled));
        };
    };
};

class Extended_Init_EventHandlers {
    class ACE_ConcertinaWireCoil {
        class ADDON {
            init = QUOTE(_this call DEFUNC(dragging,initObject));
        };
    };
    class ACE_ConcertinaWire {
        class ADDON {
            init = QUOTE(call FUNC(handleInit));
        };
    };
    class Land_Razorwire_F {
        class ADDON {
            init = QUOTE(call FUNC(handleInit));
        };
    };
};
