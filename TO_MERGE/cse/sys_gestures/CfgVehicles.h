class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};
	class cse_sys_gestures: Module_F {
		scope = 2; 
		displayName = "Gestures [CSE]";
		icon = "\cse\cse_main\data\cse_groups_module.paa";
		category = "cseMisc";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments	{
			class allowAIControl {	
				displayName = "Allow AI Control";
				description = "Allow Group leaders to issue basic orders through gestures"; 
				typeName = "BOOL";
				defaultValue = true;
			};			
		};
		class ModuleDescription {
			description = "Enables the CSE Gesture actions."; 
			sync[] = {};
		};
	};
};