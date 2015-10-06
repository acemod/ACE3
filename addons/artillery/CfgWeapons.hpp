class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    
	class ACE_M1A2_AimingPost: ACE_ItemCore {
        scope = 2;
        scopeCurator = 2;
        displayName = "M1A2 Aiming Post";
		author = ECSTRING(common,ACETeam);
		
		model="a3\structures_f_heli\Items\Luggage\PlasticCase_01_small_F.p3d";
		icon=PATHTOF(m1a2_aimingpost\data\ui\map_aimingpost_ca.paa);
		picture=PATHTOF(m1a2_aimingpost\data\ui\aimingpost_equip_ca.paa);
		
        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };
	
    class ACE_M1A1_Collimator: ACE_ItemCore {
        scope = 2;
        scopeCurator = 2;
        displayName = "M1A1 Aiming Collimator";
		author = ECSTRING(common,ACETeam);
		
		model=PATHTOF(m1a1_collimator\M1A1_Collimator_Equip_F.p3d);
		icon=PATHTOF(m1a1_collimator\data\ui\map_collimator_ca.paa);
		picture=PATHTOF(m1a1_collimator\data\ui\collimator_equip_ca.paa);

        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };
};