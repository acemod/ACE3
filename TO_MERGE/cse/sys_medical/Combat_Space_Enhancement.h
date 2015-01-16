#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

class Combat_Space_Enhancement {
	class cfgModules {
		class cse_sys_medical {
			init = "call compile preprocessFile 'cse\cse_sys_medical\init_sys_medical.sqf';";
			name = "Combat Medical System";
			class EventHandlers {
				class CAManBase {
					init = "_this call cse_fnc_initForUnit_CMS;";
					handleDamage = "_this call cse_fnc_handleDamage_CMS;"; 
					handleHeal = "_this call cse_fnc_handleHeal_CMS;"; 
					killed = "_this call cse_eh_killed_CMS;";
					local = "_this call cse_eh_local_CMS;";
				};
			};
			class Configurations {
				class combat_medical_system_openMenu {
					type = MENU_KEYBINDING;
					title = $STR_OPEN_CMS_MENU_TITLE;
					description = $STR_OPEN_CMS_MENU_DESC;
					value[] = {0,0,0,0};
					onPressed = "[] call cse_fnc_openMenu_CMS";
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
			class cse_sys_medical_onUnconscious {
				onCall = "_this call cse_fnc_onUnconscious_CMS;";
			};
		};
	};	
};