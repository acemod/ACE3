class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
		};
	};
	class cse_sys_advanced_interaction: Module_F {
		scope = 2; 
		displayName = "Advanced Interaction [CSE]";
		icon = "\cse\cse_main\data\cse_aim_module.paa";
		category = "cseModules";
		function = "cse_fnc_initalizeModule_F";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 0;
		class Arguments
		{

			class enableDetain {	
				displayName = "Allow detaining";
				description = "Allow players to detain other units"; 
				typeName = "NUMBER";
				defaultValue = 2;
				class values {
					class all {name="Everyone"; value=3; };
					class onlyOtherSide {name="Opposite side"; value=2; default=1;};
					class onlyAI {name="AI Only"; value=1; };
					class onlyOtherSideAI {name="Opposite side AI only"; value=0; };
					class disable {name="Disable"; value=-1; };
				};
			};
			class enableSearch {
				displayName = "Allow search";
				description = "Allow players to search other units and vehicles"; 
				typeName = "NUMBER";
				defaultValue = 2;
				class values {
					class all {name="Everyone"; value=3; };
					class onlyOtherSide {name="Opposite side"; value=2; default=1;};
					class onlyAI {name="AI Only"; value=1; };
					class onlyOtherSideAI {name="Opposite side (AI Only)"; value=0; };
					class disable {name="Disable"; value=-1; };
				};
			};
			class enableBiometric {	
				displayName = "Biometric Scanner";
				description = "Allow players to use the biometric scanner on other units"; 
				typeName = "NUMBER";
				defaultValue = 2;
				class values {
					class all {name="Everyone"; value=3; };
					class onlyOtherSide {name="Opposite side"; value=2; default=1;};
					class onlyAI {name="AI Only"; value=1; };
					class onlyOtherSideAI {name="Opposite side (AI Only)"; value=0; };
					class disable {name="Disable"; value=-1; };
				};
			};
			class enableConversation {	
				displayName = "Enable Conversation";
				description = "Allow Conversation with civilians"; 
				typeName = "BOOL";
				defaultValue = false;
			};
			class useEquipment {	
				displayName = "Equipment Required";
				description = "Is AIM equipment required for performing actions?"; 
				typeName = "BOOL";
				defaultValue = true;
			};
		};
	};
	class cse_moduleAmbientCivilians: Module_F {
		scope = 2; 
		displayName = "Ambient civilians [CSE]";
		icon = "\cse\cse_main\data\cse_aim_module.paa";
		category = "cseMisc";
		function = "cse_fnc_moduleAmbientcivilians";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		class Arguments	{
			class maxCivilians {
				displayName = "Max Civilians";
				description = "The maximum amount of civilians at any given time"; 
				typeName = "NUMBER";
				defaultValue = 50;
			};
			class maxRadius {
				displayName = "Max Radius";
				description = "The maximum radus around object"; 
				typeName = "NUMBER";
				defaultValue = 1000;
			};
			class minPlayerDistance {
				displayName = "Minimal Player distance";
				description = "The minimal distance players can be near spawn locations"; 
				typeName = "NUMBER";
				defaultValue = 250;
			};
			class percentageOf {
				displayName = "Percentage";
				description = "Chance of building occupied ( 1 = 100%, 0 = 0%)"; 
				typeName = "NUMBER";
				defaultValue = 0.3;
			};

			class factionOf {
				displayName = "Faction";
				description = "Of what faction should the civilians be"; 
				typeName = "STRING";
				defaultValue = "CIV_F";
			};
			class weaponChance {
				displayName = "Chance of Weapons";
				description = "What is the chance that spawned civilans have weapons"; 
				typeName = "NUMBER";
				defaultValue = 0;
			};
			class hostilityToBlufor {
				displayName = "Hostility to BLUFOR";
				description = "What is the initial stance towards BLUFOR"; 
				typeName = "NUMBER";
				defaultValue = 0;
			};
			class hostilityToOPfor {
				displayName = "Hostility to OPFOR";
				description = "What is the initial stance towards OPFOR"; 
				typeName = "NUMBER";
				defaultValue = 0;
			};

		};
	};
	class NATO_Box_Base;
	class cse_advancedInteractionItems: NATO_Box_Base
	{
		scope = 2;
		displayName = "Advanced Interaction Items [CSE]";
		author = "Combat Space Enhancement";
		model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";
		class TransportWeapons
		{
			class _xx_cse_Keycuffs
			{
				weapon="cse_Keycuffs";
				count=5;
			};
			class _xx_cse_HIIDE
			{
				weapon="cse_HIIDE";
				count=5;
			};
			class _xx_cse_oldphone
			{
				weapon="cse_oldphone";
				count=5;
			};
			class _xx_cse_oldphone_folded
			{
				weapon="cse_oldphone_folded";
				count=5;
			};
			class _xx_cse_watch_expensive
			{
				weapon="cse_watch_expensive";
				count=5;
			};
			class _xx_cse_wallet
			{
				weapon="cse_wallet";
				count=5;
			};
			class _xx_cse_9v_battery
			{
				weapon="cse_9v_battery";
				count=5;
			};
			class _xx_cse_notebook
			{
				weapon="cse_notebook";
				count=5;
			};
			class _xx_cse_scissors
			{
				weapon="cse_scissors";
				count=5;
			};
			class _xx_cse_wires
			{
				weapon="cse_wires";
				count=5;
			};
		};
	};

	class Item_Base_F;
	class cse_KeycuffsItem: Item_Base_F {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Keycuffs";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_Keycuffs
			{
				name = "cse_Keycuffs";
				count = 1;
			};
		};
	};
	class cse_HIIDEItem: Item_Base_F {
		author = "Combat Space Enhancement";
		scope = 2;
		descriptionUse = "Biometric Scanner";
		descriptionShort = "";
		displayName = "Biometric Scanner (HIIDE)";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_HIIDE
			{
				name = "cse_HIIDE";
				count = 1;
			};
		};
	 };
	 class cse_oldphoneItem: Item_Base_F {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Old Phone";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_oldphone
			{
				name = "cse_oldphone";
				count = 1;
			};
		};
	 };	 
	 class cse_oldphone_foldedItem: Item_Base_F {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Old Phone (Folded)";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_oldphone_folded
			{
				name = "cse_oldphone_folded";
				count = 1;
			};
		};
	 };	
	 class cse_watch_expensiveItem: Item_Base_F {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Watch";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_watch_expensive
			{
				name = "cse_watch_expensive";
				count = 1;
			};
		};
	 };	 
	 class cse_walletItem: Item_Base_F {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Wallet";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_wallet
			{
				name = "cse_wallet";
				count = 1;
			};
		};
	 };
	 class cse_9v_batteryItem: Item_Base_F {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "9 volt battery";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_9v_battery
			{
				name = "cse_9v_battery";
				count = 1;
			};
		};
	 };	 
	 class cse_notebookItem: Item_Base_F {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Notebook";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_notebook
			{
				name = "cse_notebook";
				count = 1;
			};
		};
	 };
	 class cse_scissorsItem: Item_Base_F {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Scissors";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_scissors
			{
				name = "cse_scissors";
				count = 1;
			};
		};
	 }; 
	 class cse_wiresItem: Item_Base_F {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = "Wires";
		vehicleClass = "Items";
		scopeCurator = 2;
		class TransportItems
		{
			class cse_wires
			{
				name = "cse_wires";
				count = 1;
			};
		};
	 };
};