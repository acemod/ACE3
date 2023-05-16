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

class Extended_DisplayLoad_EventHandlers {
    class RscDisplayCurator {
        ADDON = QUOTE(((_this select 0) displayCtrl ID_CURATOR_MAP) call FUNC(initDisplayCurator));
    };
    class RscDisplayEGSpectator {
        ADDON = QUOTE((((_this select 0) displayCtrl ID_EG_MAP_CONTROL) controlsGroupCtrl ID_EG_MAP_CONTROLGROUP) call FUNC(initDisplaySpectator));
    };

    class RscDiary { // for loading saves use uiNamespace because missionNamespace is not restored before map is loaded
#ifdef DISABLE_COMPILE_CACHE
        ADDON = QUOTE(((_this select 0) displayCtrl ID_DIARY_MAP) call (missionNamespace getVariable [ARR_2('DFUNC(initDisplayDiary)', uiNamespace getVariable 'DFUNC(initDisplayDiary)')]););
#else
        ADDON = QUOTE(((_this select 0) displayCtrl ID_DIARY_MAP) call (uiNamespace getVariable 'DFUNC(initDisplayDiary)'););
#endif
    };
};
