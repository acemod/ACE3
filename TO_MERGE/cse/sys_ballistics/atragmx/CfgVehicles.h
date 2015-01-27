class CfgVehicles
{
	class Item_Base_F;
	class cse_ab_Item_ATragMX: Item_Base_F
	{
		scope=2;
		scopeCurator=2;
		displayName="ATragMX";
		author="Ruthberg";
		vehicleClass="Items";
		class TransportItems
		{
			class cse_ab_ATragMX
			{
				name="cse_ab_ATragMX";
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
			class _xx_cse_ab_ATragMX
			{
				weapon="cse_ab_ATragMX";
				count=5;
			};
		};
	};
};