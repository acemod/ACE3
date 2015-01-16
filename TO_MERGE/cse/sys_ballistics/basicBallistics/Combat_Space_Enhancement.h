#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

class Combat_Space_Enhancement {
	class cfgModules {
		class cse_sys_winddeflection {
			init = "call compile preprocessFile 'cse\cse_sys_ballistics\basicBallistics\init_sys_winddeflection.sqf';";
			name = "Wind Deflection";
			class EventHandlers {
				class CAManBase {
					fired = "_this call cse_fnc_handleFired_DEFLECT; false";
				};
			};
			class Configurations {
				class check_wind_direction {
					type = ACTION_KEYBINDING;
					title = "Check Wind Direction";
					description = "Displays a hint with the current wind direction and speed.";
					value[] = {0,0,0,0};
					onPressed = "[] call cse_fnc_checkWindDir_WIND;";
				};
				class open_weather_meter {
					type = ACTION_KEYBINDING;
					title = "Open the Weather Meter";
					description = "When you have the weather meter in your inventory, pressing this key will open the menu, showing you the current weather information.";
					value[] = {0,0,0,0};
					onPressed = "if (([player,'cse_weather_meter'] call cse_fnc_hasMagazine)) then { createDialog 'cse_weather_meter'; }; ";
					idd = 65423;
				};
			};			
		};
	};
};