class Combat_Space_Enhancement {
	class EventHandlers {
		class PreInit_EventHandlers {
			class cse_f_modules {
				init = " call compile preprocessFile 'cse\cse_f_modules\init.sqf';";
			};
		};
		class PostInit_EventHandlers {
			class cse_f_modules {
				init = " call compile preprocessFile 'cse\cse_f_modules\post-init.sqf';";
			};
		};
	};

	class CustomEventHandlers {
		/**
		* Called when the enableModule_f function is called. Third argument is whatever or not the module has initalized.
		*/
		class moduleEnabled_f;	// [moduleName, arguments, enabled] 
	};
};