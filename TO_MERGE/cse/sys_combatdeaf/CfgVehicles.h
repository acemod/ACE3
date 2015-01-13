class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};
	class cse_sys_combatdeaf: Module_F {
		scope = 2; 
		displayName = "Combat Deafness [CSE]";
		icon = "\cse\cse_main\data\cse_earmuffs_module.paa";
		category = "cseModules";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments {
			class DEAFNESS_EFFECT_INTENSITY {
				displayName = "Deafness effect intensity";
				description = "Allows to tune down the deafness effect (2.0 - dual intensity, 1.0 - default intensity, 0.5 - half intensity)";
				typeName = "NUMBER";
				defaultValue = 1;
			};
			class DISABLE_EAR_RINGING {
				displayName = "Disable ear ringing";
				description = "Disables the ear ringing effect";
				typeName = "BOOL";
				defaultValue = 0;
			};
		};
		class ModuleDescription {
			description = "Combat deafness";
		};
	};
	
	class Item_Base_F;
	class cse_earplugsItem: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Earplugs";
		author = "Combat Space Enhancement";
		vehicleClass = "Items";
		class TransportItems
		{
			class cse_earplugs
			{
				name = "cse_earplugs";
				count = 1;
			};
		};
	};
	class cse_earplugs_electronicItem: cse_earplugsItem
	{
		class TransportItems
		{
			class cse_earplugs_electronic
			{
				name = "cse_earplugs_electronic";
				count = 1;
			};
		};
	};
	
	class NATO_Box_Base;
	class cse_crateCombatDeafness: NATO_Box_Base
	{
		scope = 2;
		displayName = "Earplugs Crate [CSE]";
		author = "Combat Space Enhancement";	
		model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";	
		class TransportWeapons
		{
			class _xx_cse_earplugs
			{
				weapon="cse_earplugs";
				count=50;
			};
			class _xx_cse_earplugs_electronic
			{
				weapon="cse_earplugs_electronic";
				count=10;
			};
		};
	};
};
