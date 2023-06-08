class CfgMagazines {
    class EGVAR(bft_devices,MagazineCore);
    // GD300 BLUFOR
    class ACE_GD300Magazine_b: EGVAR(bft_devices,MagazineCore) {
        descriptionShort = CSTRING(GD300_itemDescription_b);
        displayName = CSTRING(GD300_itemName_b);
        model = QUOTE(PATHTOF(data\GD300.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\GD300_icon.paa));
        mass = 5;
        EGVAR(bft,type) = "ACE_GD300_b";
    };

    // GD300 OPFOR
    class ACE_GD300Magazine_o: ACE_GD300Magazine_b {
        descriptionShort = CSTRING(GD300_itemDescription_o);
        displayName = CSTRING(GD300_itemName_o);
        EGVAR(bft,type) = "ACE_GD300_o";
    };

    // GD300 OPFOR
    class ACE_GD300Magazine_i: ACE_GD300Magazine_b {
        descriptionShort = CSTRING(GD300_itemDescription_i);
        displayName = CSTRING(GD300_itemName_i);
        EGVAR(bft,type) = "ACE_GD300_i";
    };

};
