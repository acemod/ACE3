class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class EGVAR(bft_devices,ItemCore);

    // GD300 BLUFOR
    class ACE_GD300_b: EGVAR(bft_devices,ItemCore) {
        descriptionShort = CSTRING(GD300_itemDescription_b);
        displayName = CSTRING(GD300_itemName_b);
        model = QUOTE(PATHTOF(data\GD300.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\GD300_icon.paa));
        class ItemInfo: CBA_MiscItem_ItemInfo {
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

};
