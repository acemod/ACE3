class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
		};
	};
	class cse_sys_logistics: Module_F
	{
		scope = 2; 
		displayName = "Logistics [CSE]";
		icon = "\cse\cse_main\data\cse_basic_module.paa";
		category = "cseModules";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments
		{
			
		};
	};

/*	class NATO_Box_Base;
	class cse_logisticCrate : NATO_Box_Base {
		scope = 2;
		accuracy = 1000;
		displayName = "Logistic Crate";
		model = "\cse\cse_sys_logistics\data\crate\crate.p3d";
		author = "Combat Space Enhancement";
	};*/

};