class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};
	class cse_sys_groups: Module_F {
		scope = 2; 
		displayName = "Groups [CSE]";
		icon = "\cse\cse_main\data\cse_groups_module.paa";
		category = "cseModules";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments	{
			class allowGroupSwitch {
				displayName = "Group switch";
				description = "Allow players to join and leave groups"; 
				typeName = "BOOL";
				defaultValue = true;
			};	
			class allowFormationSwitch {
				displayName = "Formation actions";
				description = "Group leaders can order formation changes through the action menu"; 
				typeName = "BOOL";
				defaultValue = true;
			};	
			class allowShoulderTap {
				displayName = "Shoulder Tap";
				description = "Allow usage of shoulder taps"; 
				typeName = "BOOL";
				defaultValue = false;
			};	
		};
		class ModuleDescription {
			description = "Provides players a serie of actions to join or leave their group, as well as formation changes"; 
			sync[] = {};
		};
	};
};