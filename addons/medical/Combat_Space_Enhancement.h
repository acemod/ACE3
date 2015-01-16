#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

class Advanced_Combat_Enviroment {
	class cfgModules {
		class ADDON {
			init = "";
			name = "Combat Medical System";
			class EventHandlers {
				class CAManBase {
					init = QUOTE(_this call FUNC(initForUnit_CMS););
					handleDamage = QUOTE(_this call FUNC(handleDamage_CMS);); 
					handleHeal = QUOTE(_this call FUNC(handleHeal_CMS);); 
					killed = QUOTE(_this call ACE_eh_killed_CMS;);
					local = QUOTE(_this call ACE_eh_local_CMS;);
				};
			};
			class Configurations {
				class ADDON_openMenuKey {
					type = MENU_KEYBINDING;
					title = $STR_OPEN_CMS_MENU_TITLE;
					description = $STR_OPEN_CMS_MENU_DESC;
					value[] = {0,0,0,0};
					onPressed = QUOTE([] call FUNC(openMenu_CMS));
					idd = 314412;
				};
			};
		};
	};

	class CustomEventHandlers {
		class getMedicationOptions_CMS {}; // [target]
		class getExamineOptions_CMS {}; // [target]
		class getDragOptions_CMS {}; // [target]
		class getBandageOptions_CMS {}; // [target]
		class getAirwayOptions_CMS {}; // [target]
		class getAdvancedOptions_CMS {}; // [target]
		class onDropInjured	{};			// [_caller, _unit, number (0=from drag, 1=from carry)]
		class onDragInjured {};			// [_caller, _unit]
		class onCarryInjured {};		// [_caller, _unit]

		class setUnconsciousState {
			class ADDON_onUnconscious {
				onCall = QUOTE(_this call FUNC(onUnconscious_CMS;));
			};
		};
	};	
};