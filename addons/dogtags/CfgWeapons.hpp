class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_dogtag: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 0;
        displayName = CSTRING(itemName);
        model = "\A3\weapons_F\ammo\mag_univ.p3d"; //@todo?
        //picture = QUOTE(PATHTOF(images\picture.paa)); @todo
        class ItemInfo: InventoryItem_Base_F {
            mass = 0; //too small to for 1 ?
        };
    };
    ACE_DOGTAGS(ACE_dogtag)
};
