class CfgVehicles {
		class Logic;
		class Module_F: Logic {
			class ArgumentsBaseUnits {
			};
		};
		class cse_sys_backblast: Module_F {
		scope = 2; 
		displayName = "Backblast [CSE]";
		icon = "\cse\cse_main\data\cse_backblast_module.paa";
		category = "cse_equipment";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments {
			class inBuilding {
				displayName = "Affect Buildings";
				description = "Should backblast be affected by structures";
				typeName = "BOOL";
			};
			class forAI {
				displayName = "Enable for AI";
				description = "Should backblast be enabled for AI";
				typeName = "BOOL";
			};
			class damageModifier {
				displayName = "Damage modifier";
				description = "Select the aggressiveness of the backblast damage";
				typeName = "NUMBER";
				class  values {
					class recruit { name = "Recruit"; value = 0.5; };
					class regular { name = "Regular"; value = 1.0; default = 1; };
					class veteran { name = "Veteran"; value = 1.2; };
					class expert  { name = "Expert";  value = 1.4; };
				};
			};
			class advanced {
				displayName = "Advanced Backblast";
				description = "Should enviroment and walls have an effect on backblast?";
				typeName = "BOOL";
			};
		};
	};
};
