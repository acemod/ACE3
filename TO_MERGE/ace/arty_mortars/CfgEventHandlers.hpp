class Extended_PreInit_EventHandlers {
	class ADDON	{
		init = QUOTE(call COMPILE_FILE(XEH_pre_init));
	};
};
class Extended_PostInit_EventHandlers {
	class ADDON {
		clientInit = QUOTE(call COMPILE_FILE(XEH_postClientInit));
	};
};
//class Extended_Init_EventHandlers {
class Extended_InitPost_EventHandlers {
	class ACE_M252	{
		class ADDON {
			init = QUOTE(call COMPILE_FILE(XEH_init));
		};
	};
	class ACE_M224_1 {
		class ADDON {
			init = QUOTE(call COMPILE_FILE(XEH_init));
		};
	};
	class ACE_2b14_82mm	{
		class ADDON {
			init = QUOTE(call COMPILE_FILE(XEH_init));
		};
	};
	class ACE_120Tampella {
		class ADDON {
			init = QUOTE(call COMPILE_FILE(XEH_init));
			exclude[] = {"ACE_120Tampella_Barrel", "ACE_120Tampella_Baseplate"};
		};
	};	
};

class Extended_GetIn_Eventhandlers {
    class ACE_M252 {
		clientGetin = QUOTE(_this call FUNC(XEH_getin));
    };
    class ACE_M224_1 {
		clientGetin = QUOTE(_this call FUNC(XEH_getin));
    };
    class ACE_2b14_82mm {
		clientGetin = QUOTE(_this call FUNC(XEH_getin));
    };
	class ACE_120Tampella {
		clientGetin = QUOTE(_this call FUNC(XEH_getin));
	};	
};

class Extended_GetOut_Eventhandlers {
    class ACE_M252 {
		clientGetout = QUOTE(_this call FUNC(XEH_getout));
    };
    class ACE_M224_1 {
		clientGetout = QUOTE(_this call FUNC(XEH_getout));
    };
    class ACE_2b14_82mm {
		clientGetout = QUOTE(_this call FUNC(XEH_getout));
    };
	class ACE_120Tampella {
		clientGetout = QUOTE(_this call FUNC(XEH_getout));
	};	
};
