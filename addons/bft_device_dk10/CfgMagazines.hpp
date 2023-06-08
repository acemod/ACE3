class CfgMagazines {
    class EGVAR(bft_devices,MagazineCore);
    // DK10 BLUFOR
    class ACE_DK10Magazine_b: EGVAR(bft_devices,MagazineCore) {
        descriptionShort = CSTRING(DK10_itemDescription_b);
        displayName = CSTRING(DK10_itemName_b);
        model = QUOTE(PATHTOF(data\DK10.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\DK10_icon.paa));
        mass = 40;
        EGVAR(bft,type) = "ACE_DK10_b";
    };

    // DK10 OPFOR
    class ACE_DK10Magazine_o: ACE_DK10Magazine_b {
        descriptionShort = CSTRING(DK10_itemDescription_o);
        displayName = CSTRING(DK10_itemName_o);
        EGVAR(bft,type) = "ACE_DK10_o";
    };

    // DK10 IND
    class ACE_DK10Magazine_i: ACE_DK10Magazine_b {
        descriptionShort = CSTRING(DK10_itemDescription_i);
        displayName = CSTRING(DK10_itemName_i);
        EGVAR(bft,type) = "ACE_DK10_i";
    };
};
