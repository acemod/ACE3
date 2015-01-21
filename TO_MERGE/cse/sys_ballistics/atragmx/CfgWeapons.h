class CfgWeapons
{
	class ItemCore;
	class InventoryItem_Base_F;
	class cse_ab_ATragMX: ItemCore
	{
		scope=2;
		value = 1;
		count = 1;
		type = 16;		
		displayName="ATragMX";
		picture="\cse\cse_sys_ballistics\atragmx\data\ATrag_Icon.paa";
		descriptionShort="Rugged PDA with ATragMX";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=4;
			type=201;
		};
	};
};