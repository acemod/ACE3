class Extended_PreInit_EventHandlers {
	class ADDON	{
		clientInit = QUOTE(call COMPILE_FILE(XEH_preClientInit));
	};
};

class Extended_PostInit_EventHandlers {
	class ADDON {
		clientInit = QUOTE(call COMPILE_FILE(XEH_postClientInit));
	};
};
