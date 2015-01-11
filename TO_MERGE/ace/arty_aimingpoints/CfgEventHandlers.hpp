class Extended_PreInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_FILE(XEH_pre_init));
	};
};

class Extended_PostInit_EventHandlers {
	class ADDON {
		clientInit = QUOTE(call COMPILE_FILE(XEH_post_init));
	};
};

class Extended_Init_EventHandlers {
	class ACE_Arty_M1A1_Collimator	{
		init = QUOTE(call COMPILE_FILE(XEH_collimator_init));
	};
	class ACE_Arty_M2A2_Aiming_Circle	{
		init = QUOTE(_this call FUNC(aimingCircleInit));
	};
};

class Extended_GetIn_Eventhandlers {
    class ACE_Arty_M2A2_Aiming_Circle {
		clientGetin = QUOTE(_this call FUNC(aimingCircleGetIn));
    };
};
class Extended_GetOut_Eventhandlers {
    class ACE_Arty_M2A2_Aiming_Circle {
		clientGetout = QUOTE(_this call FUNC(aimingCircleGetOut));
    };
};
