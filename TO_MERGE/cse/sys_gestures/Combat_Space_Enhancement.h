#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

class Combat_Space_Enhancement {
	class cfgModules {
		class cse_sys_gestures {
			init = "call compile preprocessFile 'cse\cse_sys_gestures\init_sys_gestures.sqf';";
			name = "Gestures";

			/*class Configurations {
				class playGesture_Freeze {
					type = ACTION_KEYBINDING;
					title = $STR_CSE_GESTURE_FREEZE_TOOLTIP;
					description = $STR_CSE_GESTURE_FREEZE_TOOLTIP;
					value[] = {0,0,0,0};
					onPressed = "[player, 'gestureFreeze'] call cse_fnc_playGesture";
				};

				class playGesture_Follow {
					type = ACTION_KEYBINDING;
					title = $STR_CSE_GESTURE_FOLLOW_TOOLTIP;
					description = $STR_CSE_GESTURE_FOLLOW_TOOLTIP;
					value[] = {0,0,0,0};
					onPressed = "[player, 'gestureFollow'] call cse_fnc_playGesture";
				};

				class playGesture_CEASEFIRE {
					type = ACTION_KEYBINDING;
					title = $STR_CSE_GESTURE_CEASEFIRE_TOOLTIP;
					description = $STR_CSE_GESTURE_CEASEFIRE_TOOLTIP;
					value[] = {0,0,0,0};
					onPressed = "[player, 'gestureCeaseFire'] call cse_fnc_playGesture";
				};

				class playGesture_COVER {
					type = ACTION_KEYBINDING;
					title = $STR_CSE_GESTURE_COVER_TOOLTIP;
					description = $STR_CSE_GESTURE_COVER_TOOLTIP;
					value[] = {0,0,0,0};
					onPressed = "[player, 'gestureCover'] call cse_fnc_playGesture";
				};

				class playGesture_Go {
					type = ACTION_KEYBINDING;
					title = $STR_CSE_GESTURE_GO_TOOLTIP;
					description = $STR_CSE_GESTURE_GO_TOOLTIP;
					value[] = {0,0,0,0};
					onPressed = "[player, 'gestureGo'] call cse_fnc_playGesture";
				};
				class playGesture_Point {
					type = ACTION_KEYBINDING;
					title = $STR_CSE_GESTURE_POINT_TOOLTIP;
					description = $STR_CSE_GESTURE_POINT_TOOLTIP;
					value[] = {0,0,0,0};
					onPressed = "[player, 'gesturePoint'] call cse_fnc_playGesture";
				};
			};*/
		};
	};
};
