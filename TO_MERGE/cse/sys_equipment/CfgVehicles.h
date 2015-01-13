class CfgVehicles
{
	class Land_HelipadEmpty_F;
	class cse_LogicDummy: Land_HelipadEmpty_F
	{
		scope = 1;
		slx_xeh_disabled = 1;
		class EventHandlers {
			init = "(_this select 0) enableSimulation false";
		};
	};

	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};

	class cse_sys_equipment: Module_F {
		scope = 2;
		displayName = "Equipment Options [CSE]"; 
		icon = "\cse\cse_main\data\cse_basic_module.paa";
		category = "cse_equipment";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments	{
			class magazineRepack {
				displayName = "Magazine Repack";
				description = "Lets players repack their magazines in the field";
				typeName = "BOOL";
				defaultValue = true;
			};
			class attachableItems {
				displayName = "Attachable Items";
				description = "Allows for attaching chemlights, IR strobes and the like";
				typeName = "BOOL";
				defaultValue = true;
			};
			class weaponResting {
				displayName = "Weapon Resting";
				description = "Allow players to rest their weapons and deploy bipods.";
				typeName = "BOOL";
				defaultValue = true;
			};
			class weaponSafety {
				displayName = "Weapon Safety";
				description = "Allow players to put their weapons on safe.";
				typeName = "BOOL";
				defaultValue = true;
			};
			class adjustableNVG {
				displayName = "NVG Adjustments";
				description = "Allow players to adjust their NVG brightness";
				typeName = "BOOL";
				defaultValue = true;
			};
			class allowWeaponSelect {
				displayName = "Weapon selection";
				description = "Allow players to select weapons through keybindings";
				typeName = "BOOL";
				defaultValue = true;
			};
			class allowAmmoChecking {
				displayName = "Ammo Checking";
				description = "Allow players to check their Ammunition";
				typeName = "BOOL";
				defaultValue = true;
			};
			class hideAmmoValues {
				displayName = "Hide Ammo";
				description = "Hide the Ammunition counter for players";
				typeName = "NUMBER";
				defaultValue = 0;
				class values {
					class enable {
						name = "Yes";
						value = 1;
					};
					class disable {
						name = "No";
						value = 0;
						default = 1;
					};
				};				
			};
		};
		class ModuleDescription {
			description = "Various actions/equipment settings.";
			sync[] = {};
		};
	};

	// BACKWARDS COMPATABILITY MODULES PRESSENCE
	class cse_sys_magazineRepack: Module_F	{
		scope = 1; // hidden for backwards compatability
		displayName = "Magazine Repack [CSE]"; 
		icon = "\cse\cse_main\data\cse_basic_module.paa";
		category = "cse_equipment";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments	{
		};
		class ModuleDescription {
			description = "Lets players repack their magazines in the field";
			sync[] = {};
		};
	};
	class cse_sys_attachableItems: Module_F	{
		scope = 1; // hidden for backwards compatability
		displayName = "Attachable Items [CSE]"; 
		icon = "\cse\cse_main\data\cse_basic_module.paa";
		category = "cse_equipment";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments	{
		};
		class ModuleDescription {
			description = "Allows for attaching chemlights, IR strobes and the like";
			sync[] = {};
		};
	};

	class cse_sys_weaponrest: Module_F {
		scope = 1; // hidden for backwards compatability
		displayName = "Weapon Resting [CSE]";
		icon = "\cse\cse_main\data\cse_rifle_module.paa";
		category = "cse_equipment";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments
		{

		};
	};

	class cse_sys_weaponsafety: Module_F {
		scope = 1; // hidden for backwards compatability
		displayName = "Weapon Safety [CSE]";
		icon = "\cse\cse_main\data\cse_rifle_module.paa";
		category = "cse_equipment";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments
		{

		};
	};

	class cse_sys_nightvision: Module_F {
		scope = 1;  // hidden for backwards compatability
		displayName = "Night Vision [CSE]";
		icon = "\cse\cse_main\data\cse_nvg_module.paa";
		category = "cse_equipment";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments {
		};
	};
	// END BACKWARDS COMPATABILITY


	// curator modules
	class cse_moduleGroundFlare_White: Module_F	{
		scope = 1;
		scopeCurator = 2; 
		displayName = "White Flare (Ground)"; 
		icon = "\a3\Modules_F_Curator\Data\iconFlare_ca.paa";
		category = "Effects";
		function = "cse_fnc_moduleFlare_EQ";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		author = "Combat Space Enhancement";
		ammo = "CSE_FlareWhite";
		class Arguments	{
		};
		class ModuleDescription {
			description = "Places a white flare on the ground";
			sync[] = {};
		};
	};
	class cse_moduleGroundFlare_Red: cse_moduleGroundFlare_White {
		displayName = "Red Flare (Ground)"; 
		ammo = "CSE_FlareRed";
		class Arguments	{
		};
		class ModuleDescription {
			description = "Places a red flare on the ground";
			sync[] = {};
		};
	};
	class cse_moduleGroundFlare_Yellow: cse_moduleGroundFlare_White {
		displayName = "Yellow Flare (Ground)"; 
		ammo = "CSE_FlareYellow";
		class Arguments	{
		};
		class ModuleDescription {
			description = "Places a yellow flare on the ground";
			sync[] = {};
		};
	};	
	class cse_moduleGroundFlare_Green: cse_moduleGroundFlare_White {
		displayName = "Green Flare (Ground)"; 
		ammo = "CSE_FlareGreen";
		class Arguments	{
		};
		class ModuleDescription {
			description = "Places a green flare on the ground";
			sync[] = {};
		};
	};
};