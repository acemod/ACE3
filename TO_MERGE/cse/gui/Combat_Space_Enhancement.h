class Combat_Space_Enhancement {
	class EventHandlers {
		class PostInit_EventHandlers {
			class cse_gui {
				init = " call compile preprocessFile 'cse\cse_gui\init.sqf';";
			};
		};
	};

	class CustomEventHandlers {
		class openRadialMenu {}; // [_menuName, _entries, _target]
	};	
};