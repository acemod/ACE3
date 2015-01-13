class CfgWeapons {
	class ItemCore;
	class InventoryItem_Base_F;
	class cse_earplugs: ItemCore
	{
		scope=2;
		value = 1;
		count = 1;
		type = 16;		
		displayName="Earplugs";
		model="\cse\cse_sys_combatdeaf\equipment\earplugs_simple.p3d";
		picture="\cse\cse_sys_combatdeaf\equipment\icons\earplugs_simple_icon.paa";
		descriptionShort="Earplugs";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=0.01;
			type=201;
		};
	};
	class cse_earplugs_electronic: cse_earplugs
	{
		displayName="Electronic earplugs";
		model="\cse\cse_sys_combatdeaf\equipment\earplugs_electronic.p3d";
		picture="\cse\cse_sys_combatdeaf\equipment\icons\earplugs_electronic_icon.paa";
		descriptionShort="Eletronic earplugs";
	};
};