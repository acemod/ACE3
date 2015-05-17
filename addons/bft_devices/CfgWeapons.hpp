class CfgWeapons {
    class ItemCore;
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class GVAR(ItemCore): ItemCore {
        ace_bft_deviceType = "FBCB2Device";
        ace_bft_magazineItem = "";
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        simulation = "ItemGPS";
    };

    class ACE_DK10: GVAR(ItemCore) {
        descriptionShort = "$STR_ACE_BFT_Devices_DK10_itemDescription";
        displayName = "$STR_ACE_BFT_Devices_DK10_itemName";
        picture = QUOTE(PATHTOF(UI\inventory\DK10_icon.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 40;
        };

        ace_bft_magazineItem = "ACE_DK10Magazine";
    };

    class ACE_GD300: GVAR(ItemCore) {
        descriptionShort = "$STR_ACE_BFT_Devices_GD300_itemDescription";
        displayName = "$STR_ACE_BFT_Devices_GD300_itemName";
        model = QUOTE(PATHTOF(data\GD300.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\GD300_icon.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };

        ace_bft_magazineItem = "ACE_GD300Magazine";
    };

    class ACE_MicroDAGR_x: GVAR(ItemCore) { // temporary name change to not interfere with MicroDAGR module during integration
        descriptionShort = "$STR_ACE_BFT_Devices_MicroDAGR_itemDescription";
        displayName = "$STR_ACE_BFT_Devices_MicroDAGR_itemName";
        model = QUOTE(PATHTOF(data\MicroDAGR.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\MicroDAGR_icon.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 6;
        };

        ace_bft_magazineItem = "ACE_MicroDAGR_xMagazine";
    };

    class ACE_HelmetCam: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        descriptionShort = "$STR_ACE_BFT_Devices_HelmetCam_itemDescription";
        displayName = "$STR_ACE_BFT_Devices_HelmetCam_itemName";
        picture = QUOTE(PATHTOF(UI\inventory\HelmetCam_icon.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    }
};
