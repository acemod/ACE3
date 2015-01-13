class CfgWeapons {

	class ItemCore;
	class InventoryItem_Base_F;
	class cse_m_tablet: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		displayName = $STR_ITEM_CSE_M_TABLET_DISPLAY;
		picture = "\cse\cse_sys_cc\data\m_tablet.paa";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		descriptionShort = $STR_ITEM_CSE_M_TABLET_DESC;
		descriptionUse = $STR_ITEM_CSE_M_TABLET_DESC_USE;
		cse_blueForceTracker = 1; // enable Blue Force Tracking for item
		class ItemInfo: InventoryItem_Base_F
		{
			mass=6;
			type=201;
			
		};	
	};
	class cse_m_pda: cse_m_tablet
	{	 
		descriptionUse = $STR_ITEM_CSE_M_PDA_DESC_USE;
		descriptionShort = $STR_ITEM_CSE_M_PDA_DESC;
		displayName = $STR_ITEM_CSE_M_PDA_DISPLAY;
		picture = "\cse\cse_sys_cc\data\m_pda.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
			
		};
	};
	class cse_m_tablet_uk: cse_m_tablet
	{
		descriptionUse = $STR_ITEM_CSE_M_TABLET_UK_DESC_USE;
		descriptionShort = $STR_ITEM_CSE_M_TABLET_UK_DESC;
		displayName = $STR_ITEM_CSE_M_TABLET_UK_DISPLAY;
		picture = "\cse\cse_sys_cc\data\uk_tablet.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=6;
			type=201;
			
		};		
	};
	class cse_m_tablet_o: cse_m_tablet
	{
		descriptionUse = $STR_ITEM_CSE_M_TABLET_O_DESC_USE;
		descriptionShort = $STR_ITEM_CSE_M_TABLET_O_DESC;
		displayName = $STR_ITEM_CSE_M_TABLET_O_DISPLAY;
		picture = "\cse\cse_sys_cc\data\m_tablet.paa";
	};
	class cse_m_pda_o: cse_m_pda
	{
		descriptionUse = $STR_ITEM_CSE_M_PDA_O_DESC_USE;
		descriptionShort = $STR_ITEM_CSE_M_PDA_O_DESC;
		displayName = $STR_ITEM_CSE_M_PDA_O_DISPLAY;
		picture = "\cse\cse_sys_cc\data\m_pda.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
			
		};		
	};

	class cse_m_tablet_g: cse_m_tablet
	{
		descriptionUse = $STR_ITEM_CSE_M_TABLET_G_DESC_USE;
		descriptionShort = $STR_ITEM_CSE_M_TABLET_G_DESC;
		displayName = $STR_ITEM_CSE_M_TABLET_O_DISPLAY;
		picture = "\cse\cse_sys_cc\data\m_tablet.paa";
	};
	class cse_m_pda_g: cse_m_pda
	{
		descriptionUse = $STR_ITEM_CSE_M_PDA_G_DESC_USE;
		descriptionShort = $STR_ITEM_CSE_M_PDA_G_DESC;
		displayName = $STR_ITEM_CSE_M_PDA_G_DISPLAY;
		picture = "\cse\cse_sys_cc\data\m_pda.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
			
		};		
	};

	class cse_itemHelmetCamera_W: ItemCore {
		author = "Combat Space Enhancement";
		scope = 2;
		descriptionUse = $STR_ITEM_CSE_HELMET_CAMERA_DESC_SHORT;
		descriptionShort = $STR_ITEM_CSE_HELMET_CAMERA_DESC;
		displayName = $STR_ITEM_CSE_HELMET_CAMERA_DISPLAY;
		picture = "\cse\cse_sys_cc\data\helmet_camera.paa";
		model = "\A3\weapons_F\ammo\mag_univ.p3d";
		simulation = "Weapon";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
			
		};
	};
	class cse_itemHelmetCamera_O: cse_itemHelmetCamera_W {
		descriptionUse = $STR_ITEM_CSE_HELMET_CAMERA_O_DESC_SHORT;
		descriptionShort = $STR_ITEM_CSE_HELMET_CAMERA_O_DESC;
		displayName = $STR_ITEM_CSE_HELMET_CAMERA_O_DISPLAY;
		picture = "\cse\cse_sys_cc\data\helmet_camera.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
			
		};		
	};
	class cse_itemHelmetCamera_G: cse_itemHelmetCamera_W {
		descriptionUse = $STR_ITEM_CSE_HELMET_CAMERA_G_DESC_SHORT;
		descriptionShort = $STR_ITEM_CSE_HELMET_CAMERA_G_DESC;
		displayName = $STR_ITEM_CSE_HELMET_CAMERA_G_DISPLAY;
		picture = "\cse\cse_sys_cc\data\helmet_camera.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
			
		};		
	};

	class cse_trackerItem_w: cse_m_tablet {
		displayName = $STR_ITEM_CSE_TRACKERITEM_W_DISPLAY;
		picture = "\cse\cse_sys_cc\data\m_pda.paa";
		descriptionShort = $STR_ITEM_CSE_TRACKERITEM_W_DESC;
		descriptionUse = $STR_ITEM_CSE_TRACKERITEM_W_DESC_SHORT;
		class ItemInfo: InventoryItem_Base_F
		{
			mass=1;
			type=201;
			
		};
	};
	class cse_trackerItem_o: cse_trackerItem_w {
		displayName = $STR_ITEM_CSE_TRACKERITEM_O_DISPLAY;
		descriptionShort = $STR_ITEM_CSE_TRACKERITEM_O_DESC;
		descriptionUse = $STR_ITEM_CSE_TRACKERITEM_O_DESC_SHORT;
		picture = "\cse\cse_sys_cc\data\m_pda.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
			
		};		
	};
	class cse_trackerItem_g: cse_trackerItem_w {
		displayName = $STR_ITEM_CSE_TRACKERITEM_G_DISPLAY;
		descriptionShort = $STR_ITEM_CSE_TRACKERITEM_G_DESC;
		descriptionUse = $STR_ITEM_CSE_TRACKERITEM_G_DESC_SHORT;
		picture = "\cse\cse_sys_cc\data\m_pda.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			mass=2;
			type=201;
			
		};		
	};
};