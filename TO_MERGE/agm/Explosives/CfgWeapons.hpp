class CfgWeapons {
	class AGM_ItemCore;
	class InventoryItem_Base_f;

	class AGM_ExplosiveItem: InventoryItem_Base_f {
		allowedSlots[] = {801,701,901};
		//type = 201;
	};

	class AGM_Clacker: AGM_ItemCore {
		scope = 2;
		displayName = $STR_AGM_Explosives_clacker_displayName;
		descriptionShort = $STR_AGM_Explosives_clacker_description;
		picture = "\AGM_Explosives\Data\UI\Clacker.paa";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		AGM_range = 250;
		AGM_Detonator = 1;
		
		class ItemInfo: AGM_ExplosiveItem {
			mass = 3;
			uniformModel = "\A3\weapons_F\ammo\mag_univ.p3d";
		};
	};
	class AGM_M26_Clacker: AGM_Clacker {
		displayName = $STR_AGM_Explosives_M26_displayName;
		picture = "\AGM_Explosives\Data\UI\MK26_Transmitter_ca.paa";
		AGM_range = 5000;
	};
	class AGM_DefusalKit: AGM_ItemCore {
		scope = 2;
		displayName = $STR_AGM_Explosives_DefusalKit_displayName;
		descriptionShort = $STR_AGM_Explosives_DefusalKit_description;
		picture = "\AGM_Explosives\Data\UI\pliers.paa";
		model = "\A3\Structures_F\Items\Tools\Pliers_F.p3d";
		
		class ItemInfo: AGM_ExplosiveItem {
			mass = 5;
			uniformModel = "\A3\Structures_F\Items\Tools\Pliers_F.p3d";
		};
	};
	class AGM_DeadManSwitch: AGM_ItemCore {
		scope = 2;
		displayName = $STR_AGM_Explosives_DeadManSwitch_displayName;
		descriptionShort = $STR_AGM_Explosives_DeadManSwitch_description;
		picture = "\AGM_Explosives\Data\UI\DeadmanSwitch.paa";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		AGM_range = 100;
		AGM_Detonator = 1;
		
		class ItemInfo: AGM_ExplosiveItem {
			mass = 2;
			uniformModel = "\A3\weapons_F\ammo\mag_univ.p3d";
		};
	};
};
