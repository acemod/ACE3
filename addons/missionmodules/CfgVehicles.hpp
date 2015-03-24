class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};

	// TODO make a curator variant for this
	class ACE_moduleAmbianceSound: Module_F {
		scope = 2;
		displayName = "Ambiance Sounds [ACE]";
		icon = QUOTE(PATHTOF(UI\Icon_Module_Ambient_Sounds_ca.paa));
		category = "ACE_missionModules";
		function = QUOTE(FUNC(moduleAmbianceSound));
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		author = "Glowbal";
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
				defaultValue = 1;
			};
		};
		class ModuleDescription {
			description = "Ambiance sounds loop (synced across MP)";
			sync[] = {};
		};
	};
};
