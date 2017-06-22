class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_DebugPotato: ACE_ItemCore {
        displayName = "ACE Potato (debug)";
        descriptionShort = "Glorious Potato<br/>If you see this in game it means someone fucked up";
        picture = QPATHTOF(UI\potato_ca.paa);
        scope = 1;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
};
