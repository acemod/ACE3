#include "script_component.hpp"

class Extended_PreInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_FILE(XEH_preInit));
		clientInit = QUOTE(call COMPILE_FILE(XEH_preClientInit));
	};
};

class Extended_PostInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_FILE(XEH_postInit));
	};
};

// extended object-based handlers
class Extended_FiredBIS_EventHandlers {
	class ace_arty_m119_base {
		ADDON = QUOTE(_this call FUNC(onFired_cartEject));
	};
};
/*
class Extended_Init_EventHandlers {
	class Helicopter {
		class ADDON {
			clientInit = QUOTE(if (local (_this select 0)) then {_this call FUNC(ffar_fix_init)});
		};
	};
};
*/
class Extended_Init_EventHandlers {
	class ace_arty_60mm_m721_m766_parachute {
		// TODO: Nou - _this call FUNC(...)
		class ADDON {
			init = QUOTE(_this call COMPILE_FILE(60mm\XEH_illum_init));
		};
	};
	class ace_arty_81mm_m853a1_m772_parachute {
		// TODO: Nou - _this call FUNC(...)
		class ADDON {
			init = QUOTE(_this call COMPILE_FILE(81mm\XEH_illum_init));
		};
	};
	class ace_arty_82mm_illum_ftsq_parachute {
		// TODO: Nou - _this call FUNC(...)
		class ADDON {
			init = QUOTE(_this call COMPILE_FILE(82mm\XEH_illum_init));
		};
	};
	class ace_arty_105mm_m314a3_m782_parachute {
		// TODO: Nou - _this call FUNC(...)
		class ADDON {
			init = QUOTE(_this call COMPILE_FILE(105mm\XEH_illum_init));
		};
	};
	class ace_arty_120mm_dm26_dm93_parachute {
		// TODO: Nou - _this call FUNC(...)
		class ADDON {
			init = QUOTE(_this call COMPILE_FILE(120mm\XEH_illum_init));
		};
	};	
	
};
