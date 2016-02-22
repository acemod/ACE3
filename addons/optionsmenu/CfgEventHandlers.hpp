
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

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayMain {
        GVAR(loadMainMenuBox) = QUOTE(_this call COMPILE_FILE(init_loadMainMenuBox));

        //Hide the button if there is no world (-world=empty)
        GVAR(hideButtonEmptyWorld) = "((_this select 0) displayCtrl 80085) ctrlShow (missionName != '');";
    };
};
