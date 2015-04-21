
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_IR_Strobe_Item: ACE_ItemCore {
        ACE_attachable = "ACE_IR_Strobe_Effect";
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "$STR_ACE_IrStrobe_Name";
        descriptionShort = "$STR_ACE_IrStrobe_Description";
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = PATHTOF(UI\irstrobe_item.paa);

        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
};
