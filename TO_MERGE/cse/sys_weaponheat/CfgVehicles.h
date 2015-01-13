class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};
	class cse_sys_weaponheat: Module_F {
		scope = 2; 
		displayName = "Weapon Heat [CSE]";
		icon = "\cse\cse_main\data\cse_rifle_module.paa";
		category = "cseModules";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments {
			class genericSpareBarrel {
				displayName = "Generic Spare Barrel";
				description = "Allow players to use a generic spare barrel that fits all weapons.";
				typeName = "BOOL";
				defaultValue = true;
			};
		};
		class ModuleDescription {
			description = "Weapon heating";
		};
	};
	
	class Item_Base_F;
	class cse_sparebarrelbagItem: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "Spare Barrel Bag";
		author = "Combat Space Enhancement";
		vehicleClass = "Items";
		class TransportItems
		{
			class cse_sparebarrelbag
			{
				name = "cse_sparebarrelbag";
				count = 1;
			};
		};
	};
};
