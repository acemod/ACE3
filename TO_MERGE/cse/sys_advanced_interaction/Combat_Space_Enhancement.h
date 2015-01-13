
#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

class Combat_Space_Enhancement {
	class cfgModules {
		class cse_sys_advanced_interaction {
			init = "call compile preprocessFile 'cse\cse_sys_advanced_interaction\fn_aim_init.sqf';";
			name = "Advanced Interaction Module";
			class EventHandlers {
				class CAManBase {
					//init = "waituntil{player==player}; hint 'AIM TEST';";
					killed = "_this call cse_fnc_onCivilianKilled_AIM;";
				};
			};

			class dialog_module {
				class lines {
					class agressive_OutOfMyFace {
						text = "I already told you to go away! Now get out of my face!";
					};
					class agressive_YouWontListen: agressive_OutOfMyFace {
						text = "You just won't listen, won't you?";
					};
					class agressive_SlapInFace: agressive_OutOfMyFace {
						text = "Someone should slap you in the face.";
					};
					class agressive_LeaveAlone: agressive_OutOfMyFace {
						text = "Leave me alone!";
					};
					class friendly_hello_friend {
						text = "Hello my friend!";
						stance = "Friendly";
					};
					class friendly_haveNiceDay: friendly_hello_friend {
						text = "Good Sir, I hope you have a nice day";
					};
					class friendly_welcome: friendly_hello_friend {
						text = "Welcome";
					};
					class friendly_whatbringsyouhere: friendly_hello_friend {
						text = "Hello, what brings you here?";
					};
				};
			};

			class Configurations {
				class open_biometric_scanner_aim {
					type = MENU_KEYBINDING;
					title = "Open Biometric Scanner";
					description = "Opens the biometric scanner if the action is available. The action will be available if you are looking at another Person.";
					value[] = {0,0,0,0};
					onPressed = "if (CSE_ENABLED_BIOMETRIC_SCANNER_AIM) then {_target = cursorTarget;if (!iSNull _target) then {if ((_target isKindOf 'CAManBase') && ((player distance _target) < 10)) then {[player,_target] call cse_fnc_biometricScanner;};};};";
					idd = 432231;
				};
			};
		};
	};
};