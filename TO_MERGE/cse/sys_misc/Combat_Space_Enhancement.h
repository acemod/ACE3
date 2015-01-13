class Combat_Space_Enhancement {
	class cfgModules {
		class cse_adjust_stamina {
			init = "call compile preprocessFile 'cse\cse_sys_misc\stamina\init.sqf';";
			name = "Stamina adjustment";
		};
		class cse_damage_ai {
			init = "call compile preprocessFile 'cse\cse_sys_misc\damage\init.sqf';";
			name = "Damage thresholds for AI";
			class EventHandlers {
				class CAManBase {
					handleDamage = "_this call cse_fnc_handleDamage_DMG;";
				};
			};
		};

		class cse_moduleDamageSettings {
			init = "call compile preprocessFile 'cse\cse_sys_misc\damage\init.sqf';";
			name = "Damage thresholds for AI and players";
			class EventHandlers {
				class CAManBase {
					handleDamage = "_this call cse_fnc_handleDamage_DMG;";
				};
			};
		};
		
		class cse_moduleRemoveBodyOnDisconnect {
			init = "call compile preprocessFile 'cse\cse_sys_misc\moduleRemoveBodyOnDisconnect.sqf';";
			name = "Remove Player bodies on disconnect";
		};
	};
};