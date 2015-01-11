class Extended_PreInit_EventHandlers {
	class ADDON	{
		init = QUOTE(call COMPILE_FILE(XEH_pre_init));
	};
};
class Extended_Init_EventHandlers {
	class ace_arty_m119	{
		init = QUOTE(call COMPILE_FILE(XEH_init));
	};
};
class Extended_GetIn_Eventhandlers {
    class ace_arty_m119 {
		class ADDON {
			clientGetin = QUOTE(_this call FUNC(XEH_getin));
		};
    };
};
class Extended_GetOut_Eventhandlers {
    class ace_arty_m119 {
		class ADDON {
			clientGetOut = QUOTE(_this call FUNC(XEH_getout));
		};
	};
};
