#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

class Combat_Space_Enhancement
{
  class EventHandlers {
    class PostInit_EventHandlers {
      class cse_main {
        init = " call compile preprocessFile 'cse\cse_main\init.sqf';";
      };
    };
  };
  class cfgModules {
		class cse_main {
			init = "";
			name = "Main";
			class EventHandlers {
				class CAManBase {
					respawn = "_this call cse_fnc_resetAllDefaults_F;";
				};
			};

			class Configurations {
				class ActionAcceptRequest_f {
					type = ACTION_KEYBINDING;
					title = $STR_CSE_ACTION_ACCEPT_REQUEST_KEY_TITLE;
					description = $STR_CSE_ACTION_ACCEPT_REQUEST_KEY_TOOLTIP;
					value[] = {0,0,0,0};
					onPressed = "if (!isnil 'CSE_RECIEVE_REQUEST_ID_KEY_BINDING') then {[player,CSE_RECIEVE_REQUEST_ID_KEY_BINDING, true] call cse_fnc_onAnswerRequest;};";
				};
				class ActionDeclineRequest_f {
					type = ACTION_KEYBINDING;
					title = $STR_CSE_ACTION_DECLINE_REQUEST_KEY_TITLE;
					description = $STR_CSE_ACTION_DECLINE_REQUEST_KEY_TOOLTIP;
					value[] = {0,0,0,0};
					onPressed = "if (!isnil 'CSE_RECIEVE_REQUEST_ID_KEY_BINDING') then {[player,CSE_RECIEVE_REQUEST_ID_KEY_BINDING, false] call cse_fnc_onAnswerRequest;};";
				};
			};
		};

		class cse_basicRevive {
			init = "_this call cse_fnc_moduleEnableBasicRevive;";
			name = "Basic Revive";
		};

		class cse_basic_revive : cse_basicRevive {
			init = "_this call cse_fnc_moduleEnableBasicRevive; ['Incorrect basic revive classname. Please change cse_basic_revive to cse_basicRevive in your enabledModules_sample.hpp file.'] call BIS_fnc_error; ";
		};
	};
	class CustomEventHandlers {
		class variableDefined {}; // [_name,_value,_defaultGlobal,_catagory,_code, _persistent]
		class AddedTotaskPool {}; // [_args, _code]
		class killed {}; // [unit, bool]
		class setVolume {}; // [bool]
		class disableKeyInput {}; // [bool]
		class switchToGroupSide {}; // [unit, bool, id (String), side]
		class resetToDefaults {}; // [unit]
	};	
};