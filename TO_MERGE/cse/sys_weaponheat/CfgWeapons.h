class CfgWeapons {
	class ItemCore;
	class InventoryItem_Base_F;
	class cse_sparebarrelbag: ItemCore
	{
		scope=2;
		displayName="Spare Barrel Bag";
		// TODO: Replace the place holders
		model="\cse\cse_sys_weaponheat\equipment\barrel_m16.p3d";
		picture="\cse\cse_sys_weaponheat\equipment\img\barrel_m16.paa";
		descriptionShort="Spare Barrel Bag";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=40;
			type=201;
		};
	};
	
	class cse_barrel_m16: cse_sparebarrelbag
	{
		displayName="M16 Spare Barrel";
		descriptionShort="M16 Spare Barrel";
		model="\cse\cse_sys_weaponheat\equipment\barrel_m16.p3d";
		picture="\cse\cse_sys_weaponheat\equipment\img\barrel_m16.paa";
	};
	
	class cse_barrel_ak74: cse_sparebarrelbag
	{
		displayName="AK Spare Barrel";
		descriptionShort="AK Spare Barrel";
		model="\cse\cse_sys_weaponheat\equipment\barrel_ak74.p3d";
		picture="\cse\cse_sys_weaponheat\equipment\img\barrel_ak74.paa";
	};
	
	class Rifle_Base_F;
	class arifle_MX_Base_F;
	class arifle_MX_SW_F: arifle_MX_Base_F
	{
		cse_exchangeableBarrel = 1;
	};
	class LMG_Zafir_F: Rifle_Base_F
	{
		cse_exchangeableBarrel = 1;
	};
	class LMG_Mk200_F: Rifle_Base_F
	{
		cse_exchangeableBarrel = 1;
	};
};