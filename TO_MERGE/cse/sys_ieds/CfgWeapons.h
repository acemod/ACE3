class CfgWeapons {
	class ItemCore;
	class InventoryItem_Base_F;
	class cse_ied_wires: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Wires (IED Material)";
		picture = "\cse_sys_ballistics\basicBallistics\data\weatherMeter.paa";
		descriptionShort = "Necessary material for creating an IED";
		descriptionUse = "Used to connect the detonation device with the explosive";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=10;
			type=201;
		};
	};
	class cse_ied_explosive: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Explosive Material (IED Material)";
		picture = "\cse_sys_ballistics\basicBallistics\data\weatherMeter.paa";
		descriptionShort = "Provides the boom.";
		descriptionUse = "Makes the IED.";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=10;
			type=201;
		};
	};
	class cse_ied_detonator: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Detonator (IED Material)";
		picture = "\cse_sys_ballistics\basicBallistics\data\weatherMeter.paa";
		descriptionShort = "Used to detonate the explosive.";
		descriptionUse = "Ensures the explosives goes off when activated.";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=10;
			type=201;
		};
	};
	class cse_ied_pressure_plate: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Pressure Plate (IED Material)";
		picture = "\cse_sys_ballistics\basicBallistics\data\weatherMeter.paa";
		descriptionShort = "Pressure plate for creating IEDs";
		descriptionUse = "Pressure plate for creating IEDs";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=10;
			type=201;
		};
	};
	class cse_ied_reciever: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Reciever (IED Material)";
		picture = "\cse_sys_ballistics\basicBallistics\data\weatherMeter.paa";
		descriptionShort = "Radio Reciever for creating Radio activated IEDs";
		descriptionUse = "Radio Reciever for creating Radio activated IEDs";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=10;
			type=201;
		};
	};


	class cse_ied_pressureplate_small: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Pressure Plate IED (Small)";
		picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
		descriptionShort = "Pressure Plate IED (Small)";
		descriptionUse = "Pressure Plate IED (Small)";
		model = "\A3\Weapons_F\Explosives\IED_land_small";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=10;
			type=201;
		};
	};
	class cse_ied_pressureplate_large: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Pressure Plate IED (Large)";
		picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
		descriptionShort = "Pressure Plate IED (Large)";
		descriptionUse = "Pressure Plate IED (Large)";
		model = "\A3\Weapons_F\Explosives\IED_land_big";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=10;
			type=201;
		};
	};
	class cse_ied_radio_small: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Radio Triggered IED (Small)";
		picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
		descriptionShort = "Radio Triggered IED (Small)";
		descriptionUse = "Radio Triggered IED (Small)";
		model = "\A3\Weapons_F\Explosives\IED_land_small";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=10;
			type=201;
		};
	};
	class cse_ied_radio_large: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = "Radio Triggered IED (Large)";
		picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
		descriptionShort = "Radio Triggered IED (Large)";
		descriptionUse = "Radio Triggered IED (Large)";
		model = "\A3\Weapons_F\Explosives\IED_land_big";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=10;
			type=201;
		};
	};

};