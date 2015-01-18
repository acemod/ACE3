class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE( call compile preprocessFileLineNumbers QUOTE(QUOTE(PATHTOF(XEH_preInit.sqf))) );
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE( call compile preprocessFileLineNumbers QUOTE(QUOTE(PATHTOF(XEH_postInit.sqf))) );
    };
};