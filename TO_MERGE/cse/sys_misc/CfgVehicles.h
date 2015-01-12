class CfgVehicles
{
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};
	class cse_adjust_stamina: Module_F {
		scope = 2;
		displayName = "Adjust Stamina [CSE]";
		icon = "\cse\cse_main\data\cse_medical_module.paa";
		category = "cseMisc";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		author = "Combat Space Enhancement";
		class Arguments	{
			class adjustment {
				displayName = "Adjustment";
				description = "How fast should the stamina be adjusted?";
				typeName = "NUMBER";
				defaultValue = 1;
			};
		};
		class ModuleDescription {
			description = "Custom stamina adjustment module";
			sync[] = {};
		};
	};
	class cse_damage_ai: Module_F {
		scope = 1;  // hidden, for backwards compatability
		displayName = "Damage Thredshold AI [CSE]";
		icon = "\cse\cse_main\data\cse_medical_module.paa";
		category = "cse_medical";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		author = "Combat Space Enhancement";
		class Arguments	{
			class damageThresholdAI {
				displayName = "Damage Threshold AI";
				description = "How much damage does it take for an AI to be killed?";
				typeName = "NUMBER";
				defaultValue = 1;
			};
			class damageThresholdPlayers {
				displayName = "Damage Threshold Players";
				description = "How much damage does it take for a player to be killed?";
				typeName = "NUMBER";
				defaultValue = 1;
			};
		};
		class ModuleDescription {
			description = "Custom damage threshold module"; // Short description, will be formatted as structured text
			sync[] = {};
		};
	};


	class cse_moduleDamageSettings: Module_F {
		scope = 2;
		displayName = "Damage Settings [CSE]";
		icon = "\cse\cse_main\data\cse_medical_module.paa";
		category = "cse_medical";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		author = "Combat Space Enhancement";
		class Arguments	{
			class damageThresholdAI {
				displayName = "Damage Threshold AI";
				description = "How much damage does it take for an AI to be killed?";
				typeName = "NUMBER";
				defaultValue = 1;
			};
			class damageThresholdPlayers {
				displayName = "Damage Threshold Players";
				description = "How much damage does it take for a player to be killed?";
				typeName = "NUMBER";
				defaultValue = 1;
			};
		};
		class ModuleDescription {
			description = "Custom damage threshold module";
			sync[] = {};
		};
	};

	class cse_moduleAmbianceSound: Module_F {
		scope = 2;
		displayName = "Ambiance Sounds [CSE]";
		icon = "\cse\cse_main\data\cse_basic_module.paa";
		category = "cseMisc";
		function = "cse_fnc_moduleAmbianceSoundLoop";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		author = "Combat Space Enhancement";
		class Arguments	{
			class soundFiles {
				displayName = "Sounds";
				description = "Classnames of the ambiance sounds played. Seperated by ','. ";
				typeName = "STRING";
				defaultValue = "";
			};
			class minimalDistance {
				displayName = "Minimal Distance";
				description = "Minimal Distance";
				typeName = "NUMBER";
				defaultValue = 400;
			};
			class maximalDistance {
				displayName = "Maximal Distance";
				description = "Maximal Distance";
				typeName = "NUMBER";
				defaultValue = 900;
			};
			class minimalDelay {
				displayName = "Minimal Delay";
				description = "Minimal Delay between sounds played";
				typeName = "NUMBER";
				defaultValue = 10;
			};
			class maximalDelay {
				displayName = "Maximal Delay";
				description = "Maximal Delay between sounds played";
				typeName = "NUMBER";
				defaultValue = 170;
			};
			class followPlayers {
				displayName = "Follow Players";
				description = "Follow players. If set to false, loop will play sounds only nearby logic position.";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class soundVolume {
				displayName = "Volume";
				description = "The volume of the sounds played";
				typeName = "NUMBER";
				defaultValue = 0;
			};
		};
		class ModuleDescription {
			description = "Ambiance sounds loop (synced across MP)";
			sync[] = {};
		};
	};
};
