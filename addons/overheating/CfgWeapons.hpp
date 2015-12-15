class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_SpareBarrel: ACE_ItemCore {
        displayname = CSTRING(SpareBarrelName);
        descriptionshort = CSTRING(SpareBarrelDescription);
        //model = "";
        picture = QUOTE(PATHTOF(UI\spare_barrel_ca.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };

    class RifleCore;
    class Rifle: RifleCore {
        //Mean Rounds Between Stoppages (this will be scaled based on the barrel temp)
        ACE_MRBS = 3000; 
        
        //Dispersion Factor (this will be scaled based on the barrel temp)
        ACE_Dispersion = 1;
        
        //Slowdown Factor (this will be scaled based on the barrel temp)
        ACE_SlowdownFactor = 1;
    };
};
