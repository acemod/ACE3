class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class GVAR(ItemCore): ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        // cannot do ItemGPS as long as we do have to use magazines for unique items
        // simulation = "ItemGPS";
        EGVAR(bft,deviceType) = "";
        EGVAR(bft,magazineItem) = "";
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
        author = ECSTRING(common,ACETeam);
        descriptionShort = CSTRING(HelmetCam_itemDescription);
        displayName = CSTRING(HelmetCam_itemName);
        picture = QUOTE(PATHTOF(UI\inventory\HelmetCam_icon.paa));
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
    };
};
