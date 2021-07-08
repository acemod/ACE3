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

class Extended_InitPost_EventHandlers {
    class GVAR(spiderhole_01_nogeo) {
        class ADDON {
            init = QUOTE((_this select 0) setMass 1e-12);
        };
    };
    class GVAR(spiderhole_02_nogeo) {
        class ADDON {
            init = QUOTE((_this select 0) setMass 1e-12);
        };
    };
    class GVAR(spiderhole_03_nogeo) {
        class ADDON {
            init = QUOTE((_this select 0) setMass 1e-12);
        };
    };
    class vn_bicycle_base {
        class ADDON {
            init = QUOTE(call FUNC(disableCookoff));
        };
    };
};
