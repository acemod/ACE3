class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class EGVAR(bft_devices,ItemCore);

    // DK10 BLUFOR
    class ACE_DK10_b: EGVAR(bft_devices,ItemCore) {
        descriptionShort = CSTRING(DK10_itemDescription_b);
        displayName = CSTRING(DK10_itemName_b);
        model = QUOTE(PATHTOF(data\DK10.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\DK10_icon.paa));
        class ItemInfo: CBA_MiscItem_ItemInfo {
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
};
