#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

class Combat_Space_Enhancement {
	class cfgModules {
		class cse_sys_cc {
			init = "call compile preprocessFile 'cse\cse_sys_cc\init_sys_cc.sqf';";
			name = "Command and Control";
			class Configurations {
				class Command_and_Control {
					type = MENU_KEYBINDING;
					title = $STR_OPEN_CC_DEVICE_CONFIGURATION_TITLE;
					description = $STR_OPEN_CC_DEVICE_CONFIGURATION_DESC;
					value[] = {35,0,1,0};
					onPressed = "switch (true) do {case ([player,'cse_m_tablet'] call cse_fnc_hasItem_CC): {['cse_m_tablet'] call cse_fnc_openDevice_CC;};case ([player,'cse_m_tablet_uk'] call cse_fnc_hasItem_CC): {['cse_m_tablet_uk'] call cse_fnc_openDevice_CC;};case ([player,'cse_m_tablet_o'] call cse_fnc_hasItem_CC): {['cse_m_tablet_o'] call cse_fnc_openDevice_CC;};case ([player,'cse_m_pda'] call cse_fnc_hasItem_CC): {['cse_m_pda'] call cse_fnc_openDevice_CC;};case ([player,'cse_m_pda_o'] call cse_fnc_hasItem_CC): {['cse_m_pda_o'] call cse_fnc_openDevice_CC;};default {};};";
					idd = 590823;
				};
				class OpenOnBoard_BFT_Device {
					type = MENU_KEYBINDING;
					title = $STR_OPEN_CC_ONBOARD_CONFIGURATION_TITLE;
					description = $STR_OPEN_CC_ONBOARD_CONFIGURATION_DESC;
					value[] = {0,0,0,0};
					onPressed = "[vehicle player] call cse_fnc_openFlight_Display_CC;";
					idd = 590823;
				};
			};
		};
	};
};