class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
     class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
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
    class Land_vn_canisterfuel_f {
        class ADDON {
            init = QUOTE(call (missionNamespace getVariable [ARR_2(QQEFUNC(refuel,makeJerryCan),{})]));
        };
    };
    class Land_vn_fuelcan {
        class ADDON {
            init = QUOTE(call (missionNamespace getVariable [ARR_2(QQEFUNC(refuel,makeJerryCan),{})]));
        };
    };
    class vn_bicycle_base {
        class ADDON {
            init = QUOTE(call FUNC(disableCookoff));
        };
    };
};
