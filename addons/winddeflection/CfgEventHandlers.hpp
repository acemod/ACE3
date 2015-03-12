class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Fired_Eventhandlers {
	class CaManBase {
		fired = QUOTE( call FUNC(handleFired) );
	};
};