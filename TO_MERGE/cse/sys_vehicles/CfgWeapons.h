class CfgWeapons {
	class ItemCore;
	class InventoryItem_Base_F;
	
	class cse_battery: ItemCore
	{
		scope=2;
		displayName="Battery";
		model="\cse\cse_sys_vehicles\equipment\battery_darter.p3d";
		picture="\cse\cse_sys_vehicles\equipment\img\battery_dartery.paa";
		descriptionShort="Battery";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=0.01;
			type=201;
		};
	};
	
	class cse_battery_darter: cse_battery
	{
		displayName="Darter Battery";
		model="\cse\cse_sys_vehicles\equipment\battery_darter.p3d";
		picture="\cse\cse_sys_vehicles\equipment\img\battery_darter.paa";
		descriptionShort="Darter Battery";
	};
};