class Extended_PreInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_FILE(XEH_preInit));
	};
};
class Extended_PostInit_EventHandlers {
	class ADDON {
		clientInit = QUOTE(call COMPILE_FILE(XEH_postInit));
	};
};
class Extended_Killed_EventHandlers {
	class AllVehicles {
		class ADDON {
			killed = QUOTE(_this call FUNC(clearCargo));
			exclude[] = {"Man"}; //Exclude Animals and Humans
		};
	};
};

class Extended_InitPost_EventHandlers {
	class AllVehicles {
		class ADDON {
			Init = QUOTE(if (alive (_this select 0)) then {_this call FUNC(init)});
			exclude[] = {"Man"}; //Exclude Animals and Humans
		};
	};
};