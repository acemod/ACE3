class CfgWeapons {
	class ItemCore;
	class InventoryItem_Base_F;

	class cse_Keycuffs: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = $STR_CSE_ITEM_KEYCUFFS_DISPLAY;
		picture = "\cse\cse_sys_advanced_interaction\img\keycuffs.paa";
		descriptionShort = $STR_CSE_ITEM_KEYCUFFS_DESC;
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	};
	class cse_HIIDE: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		descriptionUse = $STR_CSE_ITEM_HIIDE_DESC;
		descriptionShort = $STR_CSE_ITEM_HIIDE_DESC;
		displayName = $STR_CSE_ITEM_HIIDE_DISPLAY;
		picture = "\cse\cse_sys_advanced_interaction\img\HIIDE.paa";
		model = "\cse\cse_sys_advanced_interaction\hiide.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	 };
	 class cse_oldphone: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = $STR_CSE_ITEM_PHONE_DISPLAY;
		picture = "\cse\cse_sys_advanced_interaction\img\oldphone.paa";
		model = "\cse\cse_sys_advanced_interaction\mobile.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	 };	 
	 class cse_oldphone_folded: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = $STR_CSE_ITEM_PHONE_FOLDED_DISPLAY;
		picture = "\cse\cse_sys_advanced_interaction\img\oldphone.paa";
		model = "\cse\cse_sys_advanced_interaction\mobile_folded.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	 };	
	 class cse_watch_expensive: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = $STR_CSE_ITEM_WATCH_EXPENSIVE_DISPLAY;
		picture ="cse\cse_sys_advanced_interaction\img\watch_expensive.paa";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	 };	 
	 class cse_wallet: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = $STR_CSE_ITEM_WALLET_DISPLAY;
		picture = "\cse\cse_sys_advanced_interaction\img\wallet.paa";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	 };
	 class cse_9v_battery: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = $STR_CSE_ITEM_9v_BATTERY_DISPLAY;
		picture = "\cse\cse_sys_advanced_interaction\img\9v_battery.paa"; 
		model = "\A3\Structures_F_EPA\Items\Electronics\Battery_F.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	 };	 
	 class cse_notebook: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = $STR_CSE_ITEM_NOTEBOOK_DISPLAY;
		picture = "\cse\cse_sys_advanced_interaction\img\notebook.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	 };
	 class cse_scissors: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = $STR_CSE_ITEM_SCISSORS_DISPLAY;
		picture = "\cse\cse_sys_advanced_interaction\img\scissor.paa";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	 }; 
	 class cse_wires: ItemCore {
		scope = 2;
		value = 1;
		count = 1;
		type = 16;
		mass = 1;
		displayName = $STR_CSE_ITEM_WIRES_DISPLAY;
		picture = "\cse\cse_sys_advanced_interaction\img\wires.paa";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			
			mass=10;
			type=201;
		};
	 };

};