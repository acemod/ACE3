class Extended_PreInit_EventHandlers {
	class ADDON {
		clientInit = QUOTE(call COMPILE_FILE(XEH_preClientInit));
		init = QUOTE(call COMPILE_FILE(XEH_preInit));
	};
};
class Extended_PostInit_EventHandlers {
	class ADDON {
		serverInit = QUOTE(call COMPILE_FILE(XEH_PostServerInit));
		init = QUOTE(call COMPILE_FILE(XEH_postInit));
	};
};
class Extended_FiredBIS_EventHandlers {
	class Man {
		class ADDON {
			clientFiredBisPlayer = "if (!isNull (_this select 6) && {((_this select 6) isKindOf 'bulletBase')}) then {_this call ace_sys_wind_deflection_fnc_fired_man}";
		};
	};
};
