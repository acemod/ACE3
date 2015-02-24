class Extended_PreInit_EventHandlers {
	class ADDON {
		init = QUOTE(call COMPILE_FILE(XEH_preInit));
		clientInit = QUOTE(call COMPILE_FILE(XEH_preClientInit));
	};
};
