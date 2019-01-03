class Extended_PreInit_EventHandlers {
    class ADDON    {
        init = QUOTE(call COMPILE_FILE(XEH_pre_init));
    };
};

class Extended_GetIn_Eventhandlers {
	class ADDON    {
		clientGetin = QUOTE(_this call ace_sys_crewserved_fnc_getInDragon);
	};
};
class Extended_GetOut_Eventhandlers {
	class ADDON    {
		clientGetout = QUOTE(_this call ace_sys_crewserved_fnc_getOutDragon);
	};
};