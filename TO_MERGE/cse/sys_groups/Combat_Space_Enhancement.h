#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

class Combat_Space_Enhancement {
	class cfgModules {
		class cse_sys_groups {
			init = "call compile preprocessFile 'cse\cse_sys_groups\init_sys_groups.sqf';";
			name = "Groups";

			class Configurations {
				class actionTapShoulder_GRP {
					type = ACTION_KEYBINDING;
					title = $STR_CSE_SHOULDER_TAP_TITLE;
					description = $STR_CS_SHOULDER_TAP_DESC;
					value[] = {0,0,0,0};
					onPressed = "if ([player, cursorTarget] call cse_fnc_canTapShoulder_GRP) then {[player, cursorTarget] call cse_fnc_tapShoulder_GRP;};";
				};
			};
		};
	};

	class CustomEventHandlers {
		class shoulderTapped {};	// [_caller, _target]
		class groupJoined {};		// [_unit, _targetUnit]
	};
};
