class CfgVehicles {
		class Logic;
		class Module_F: Logic {
			class ArgumentsBaseUnits {
			};
		};
		class GVAR(Module): Module_F {
		scope = 2; 
		displayName = "Basic Ballistics [ACE]";
		icon = QUOTE(PATHTOF(data\module_icon.paa));
		category = "ACE";
		function = FUNC(enableModule);
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
		};
	};
};
