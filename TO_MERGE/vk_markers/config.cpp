#include "script_component.hpp"
class cfgPatches {
	class ADDON {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"a3_ui_f","CBA_Extended_EventHandlers","CBA_MAIN"};
	};
};
#include "CfgMarkers.hpp"
class Extended_PreInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_FILE(XEH_preInit));
	};
};
class Extended_PostInit_EventHandlers {
	class ADDON {
		clientInit = QUOTE(call COMPILE_FILE(XEH_postClientInit));
	};
};
class Extended_GetIn_Eventhandlers {
	class AllVehicles {
		class ADDON {
			clientGetIn = QUOTE(_this call COMPILE_FILE(fnc_getIn));
		};
	};
};
class Extended_GetOut_Eventhandlers {
	class AllVehicles {
		class ADDON {
			clientGetOut = QUOTE(_this call COMPILE_FILE(fnc_getOut));
		};
	};
};
class Extended_Killed_EventHandlers {
	class AllVehicles {
		class ADDON {
			killed = QUOTE(_this call FUNC(killed));
		};
	};
};