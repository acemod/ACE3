class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_preInit.sqf) );
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE( call compile preprocessFileLineNumbers PATHTOF(XEH_postInit.sqf) );
    };
};

class Extended_Fired_Eventhandlers {
	class CaManBase {
		fired = QUOTE( call FUNC(handleFired) );
	};
};