class CfgVehicles {
		class Logic;
		class Module_F: Logic {
			class ArgumentsBaseUnits {
			};
		};
		class cse_sys_winddeflection: Module_F {
		scope = 2; 
		displayName = "Basic Ballistics [CSE]";
		icon = "\cse\cse_main\data\cse_rifle_module.paa";
		category = "cseModules";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments {
			class forAI {
				displayName = "Enable for AI";
				description = "Should the module be enabled for AI";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class allowNonLocal {
				displayName = "Non Local";
				description = "Should the module be enabled for non local units";
				typeName = "BOOL";
				defaultValue = 0;
			};
		};
	};
};
