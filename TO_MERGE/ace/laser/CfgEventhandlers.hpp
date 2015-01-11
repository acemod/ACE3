class Extended_PreInit_EventHandlers {
	class ADDON	{
		init = QUOTE(call COMPILE_FILE(XEH_pre_init));
	};
};

class Extended_PostInit_EventHandlers {
	class ADDON	{
		init = QUOTE(call COMPILE_FILE(XEH_post_init));
	};
};
