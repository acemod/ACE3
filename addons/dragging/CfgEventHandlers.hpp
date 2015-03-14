
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Init_EventHandlers {
    class ThingX {
        class ADDON {
            init = QUOTE(if (local (_this select 0)) then {_this call DFUNC(initObject)};);
        };
    };
};
