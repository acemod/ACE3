class CfgVehicles {
	class Logic;
	class Module_F: Logic {
		class ArgumentsBaseUnits {
		};
	};


	class cse_playerSpawnedIED: Logic {
		displayName = "Player placed IED";
	};

	class cseModule_spawnIEDs: Module_F {
		scope = 2; 
		displayName = "Create IED [CSE]";
		icon = "\cse\cse_main\data\cse_explosive_module.paa";
		category = "cseMisc";
		function = "cse_fnc_module_spawnIED";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		class Arguments	{
			class typeOfIED {
				displayName = "Type";
				description = "The Type of the IED"; 
				typeName = "NUMBER";
				class values {
					class land {name="Normal"; value=0; default=1; };
					class urban {name="Urban"; value=1; };
				};
			};

			class sizeOfIED {
				displayName = "Size";
				description = "The size of the IED"; 
				typeName = "NUMBER";
				class values {
					class small {name="Small"; value=1; default=1; };
					class large {name="Large"; value=0; };
				};
			};

			class heightOfIED {
				displayName = "Height";
				description = "The height that the IED is burried"; 
				typeName = "NUMBER";
				class values {
					class Above {name="Above Ground"; value=0; default=1; };
					class slightly {name="Slightly burried"; value=-0.015; };
					class medium {name="Medium burried"; value=-0.025; };
					class almost {name="Almost burried"; value=-0.05; };
					class fully {name="Fully burried"; value=-0.1; };
				};
			};

			class iedActivationType {
				displayName = "Activation Type";
				description = "How is the IED activated"; 
				typeName = "NUMBER";
				class values {
					class None {name="None"; value=-1; };
					class PressurePlate {name="Pressure Plate"; value=0; default=1;};
					class Radio {name="Radio"; value=1; };
				};
			};

			class activatedForTargets {
				displayName = "Activated for";
				description = "What types is the IED activated for"; 
				typeName = "NUMBER";
				class values {
					class None {name="None"; value=-1; };
					class All {name="Any type"; value=0; default=1;};
					class Vehicles {name="Any Vehicle"; value=1; };
					class Land {name="Ground Vehicles"; value=2; };
					class Air {name="Airial Vehicles"; value=3; };
					class Man {name="Man"; value=4; };
				};
			};

			class activatedForSides {
				displayName = "What sides activate this IED";
				description = "What types is the IED activated for"; 
				typeName = "NUMBER";
				class values {
					class None {name="None"; value=-1; };
					class All {name="Any side"; value=0; default=1; };
					class West {name="BLUFOR"; value=1; };
					class East {name="OpFOR"; value=2; };
					class Ind {name="Independant"; value=3; };
					class Civ {name="Civilian"; value=4; };
				};
			};
		};

		class ModuleDescription {
			description = "Create an IED on position."; // Short description, will be formatted as structured text
			sync[] = {"cseModule_spawnIEDs"};
			position = 1; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 0; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced

			class cseModule_spawnIEDs {
				description[] = { // Multi-line descriptions are supported
					"Synchronize ieds with other IEDs to create chain ieds.",
					"When one of the synchronized ieds is triggered,",
					"all other IEDs will explode as well."
				};
				position = 1; // Position is taken into effect
				direction = 0; // Direction is taken into effect
				optional = 1; // Synced entity is optional
				duplicate = 1; // Multiple entities of this type can be synced
				synced[] = {"cseModule_spawnIEDs"}; // Pre-define entities like "AnyBrain" can be used. See the list below
			};

		};
	};
	class cseModule_triggerManLinkIEDS: Module_F {
		scope = 2; 
		displayName = "Triggerman [CSE]";
		icon = "\cse\cse_main\data\cse_explosive_module.paa";
		category = "cseMisc";
		function = "cse_fnc_moduleTriggerMan_IEDS";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		class Arguments	{
			class EnableList {
				displayName = "List";
				description = "List of unit names that will be able to trigger the radio IED.";
				defaultValue = "";
			};
		};

		class ModuleDescription {
			description = "Defines units as triggerman."; // Short description, will be formatted as structured text
			sync[] = {"cseModule_spawnIEDs"};
			position = 0; // Position is taken into effect
			direction = 0; // Direction is taken into effect
			optional = 0; // Synced entity is optional
			duplicate = 1; // Multiple entities of this type can be synced

			class cseModule_spawnIEDs {
				description[] = { // Multi-line descriptions are supported
					"Synchronize module with IEDs to define.",
					"which ieds can be triggered by units listed in module,"
				};
				position = 0; // Position is taken into effect
				direction = 0; // Direction is taken into effect
				optional = 0; // Synced entity is optional
				duplicate = 1; // Multiple entities of this type can be synced
				synced[] = {"cseModule_spawnIEDs"}; // Pre-define entities like "AnyBrain" can be used. See the list below
			};
		};
	};	

	class B_Kitbag_sgg;
	class cse_thorIII_backpack: B_Kitbag_sgg {
		scope = 1;
		author = "Combat Space Enhancement";
		displayName = "THOR III - Jammer";
	};


	// class Items_base_F;
	// class cse_ied_pressureplate_small: Items_base_F {
	// 	scope = 2;
	// 	author = "Combat Space Enhancement";
	// 	displayName = "Pressure Plate IED (Small)";
	// 	picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
	// 	descriptionShort = "Pressure Plate IED (Small)";
	// 	descriptionUse = "Pressure Plate IED (Small)";
	// 	model = "\A3\Weapons_F\Explosives\IED_land_small";
	// };
	// class cse_ied_pressureplate_large: cse_ied_pressureplate_small {
	// 	scope = 2;
	// 	author = "Combat Space Enhancement";
	// 	displayName = "Pressure Plate IED (Large)";
	// 	picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
	// 	descriptionShort = "Pressure Plate IED (Large)";
	// 	descriptionUse = "Pressure Plate IED (Large)";
	// 	model = "\A3\Weapons_F\Explosives\IED_land_big";
	// };
	// class cse_ied_radio_small: cse_ied_pressureplate_small {
	// 	scope = 2;
	// 	author = "Combat Space Enhancement";
	// 	displayName = "Radio Triggered IED (Small)";
	// 	picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
	// 	descriptionShort = "Radio Triggered IED (Small)";
	// 	descriptionUse = "Radio Triggered IED (Small)";
	// 	model = "\A3\Weapons_F\Explosives\IED_land_small";
	// };
	// class cse_ied_radio_large: cse_ied_radio_small {
	// 	scope = 2;
	// 	author = "Combat Space Enhancement";
	// 	displayName = "Radio Triggered IED (Large)";
	// 	picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
	// 	descriptionShort = "Radio Triggered IED (Large)";
	// 	descriptionUse = "Radio Triggered IED (Large)";
	// 	model = "\A3\Weapons_F\Explosives\IED_land_big";
	// };
};