class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class GVAR(ItemCore): ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        // cannot do ItemGPS as long as we do have to use magazines for unique items
        // simulation = "ItemGPS";
        EGVAR(bft,deviceType) = "";
        EGVAR(bft,magazineItem) = "";
    };

    // DK10 BLUFOR
    class ACE_DK10_b: GVAR(ItemCore) {
        descriptionShort = CSTRING(DK10_itemDescription_b);
        displayName = CSTRING(DK10_itemName_b);
        model = QUOTE(PATHTOF(data\DK10.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\DK10_icon.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 40;
        };
        EGVAR(bft,deviceType) = "DK10_b";
        EGVAR(bft,magazineItem) = "ACE_DK10Magazine_b";
    };

    // DK10 OPFOR
    class ACE_DK10_o: ACE_DK10_b {
        descriptionShort = CSTRING(DK10_itemDescription_o);
        displayName = CSTRING(DK10_itemName_o);
        EGVAR(bft,deviceType) = "DK10_o";
        EGVAR(bft,magazineItem) = "ACE_DK10Magazine_o";
    };

    // DK10 IND
    class ACE_DK10_i: ACE_DK10_b {
        descriptionShort = CSTRING(DK10_itemDescription_i);
        displayName = CSTRING(DK10_itemName_i);
        EGVAR(bft,deviceType) = "DK10_i";
        EGVAR(bft,magazineItem) = "ACE_DK10Magazine_i";
    };

    // GD300 BLUFOR
    class ACE_GD300_b: GVAR(ItemCore) {
        descriptionShort = CSTRING(GD300_itemDescription_b);
        displayName = CSTRING(GD300_itemName_b);
        model = QUOTE(PATHTOF(data\GD300.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\GD300_icon.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
        EGVAR(bft,deviceType) = "GD300_b";
        EGVAR(bft,magazineItem) = "ACE_GD300Magazine_b";
    };

    // GD300 OPFOR
    class ACE_GD300_o: ACE_GD300_b {
        descriptionShort = CSTRING(GD300_itemDescription_o);
        displayName = CSTRING(GD300_itemName_o);
        EGVAR(bft,deviceType) = "GD300_o";
        EGVAR(bft,magazineItem) = "ACE_GD300Magazine_o";
    };

    // GD300 IND
    class ACE_GD300_i: ACE_GD300_b {
        descriptionShort = CSTRING(GD300_itemDescription_i);
        displayName = CSTRING(GD300_itemName_i);
        EGVAR(bft,deviceType) = "GD300_i";
        EGVAR(bft,magazineItem) = "ACE_GD300Magazine_i";
    };

    /*class ACE_MicroDAGR_x: GVAR(ItemCore) { // temporary name change to not interfere with MicroDAGR module during integration
        descriptionShort = CSTRING(MicroDAGR_itemDescription);
        displayName = CSTRING(MicroDAGR_itemName);
        model = QUOTE(PATHTOF(data\MicroDAGR.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\MicroDAGR_icon.paa));
        class ItemInfo: InventoryItem_Base_F {
            mass = 6;
        };

        EGVAR(bft,magazineItem) = "ACE_MicroDAGR_xMagazine";

        //GVAR(displayName) = GVAR(MicroDAGR_dsp);
        //GVAR(dialogName) = GVAR(MicroDAGR_dlg);
    };*/

    class ACE_HelmetCam: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        descriptionShort = CSTRING(HelmetCam_itemDescription);
        displayName = CSTRING(HelmetCam_itemName);
        picture = QUOTE(PATHTOF(UI\inventory\HelmetCam_icon.paa));
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    }
};
