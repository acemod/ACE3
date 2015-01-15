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


class Extended_Killed_Eventhandlers {
	class CaManBase {
		class ADDON {
			Killed =  QUOTE(_this call ACE_eh_killed_CMS;);
		};
	};
};

class Extended_Local_Eventhandlers {
	class CaManBase {
		class ADDON	{
			Local = QUOTE(_this call ACE_eh_local_CMS;);
		};
	};
};
class Extended_Init_Eventhandlers {
	class CaManBase {
		class ADDON	{
			init = QUOTE(_this call FUNC(initForUnit_CMS););
		};
	};
};
