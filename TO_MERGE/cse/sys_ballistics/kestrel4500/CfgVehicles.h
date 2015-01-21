class CfgVehicles
{
	class Item_Base_F;
	class cse_ab_Item_Kestrel4500: Item_Base_F
	{
		scope=2;
		scopeCurator=2;
		displayName="Kestrel4500";
		author="Ruthberg";
		vehicleClass="Items";
		class TransportItems
		{
			class cse_ab_Kestrel4500
			{
				name="cse_ab_Kestrel4500";
				count=1;
			};
		};
	};
	
	class NATO_Box_Base;
	class cse_ballisticsItemsCrate: NATO_Box_Base
	{
		scope = 2;
		displayName = "Ballistic Items [CSE]";
		author = "Combat Space Enhancement";	
		model = "\A3\weapons_F\AmmoBoxes\AmmoBox_F";	
		class TransportWeapons
		{
			class _xx_cse_ab_Kestrel4500
			{
				weapon="cse_ab_Kestrel4500";
				count=5;
			};
		};
	};
};