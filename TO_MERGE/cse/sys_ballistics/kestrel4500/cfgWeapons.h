class CfgWeapons
{
	class ItemCore;
	class InventoryItem_Base_F;
	class cse_ab_Kestrel4500: ItemCore
	{
		scope=2;
		value = 1;
		count = 1;
		type = 16;
		displayName="Kestrel4500";
		picture= "\cse\cse_sys_ballistics\kestrel4500\data\Kestrel4500_Icon.paa";
		descriptionShort="Kestrel 4500 Pocket Weather Tracker";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
		};
	};
};