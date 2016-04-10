
class CfgMagazines {
    class CA_magazine;
    class GVAR(MagazineCore): CA_magazine {
        descriptionShort = "";
        descriptionUse = "";
        displayName = "";
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
    };

    // GD300 BLUFOR
    class ACE_GD300Magazine_b: GVAR(MagazineCore) {
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

    /*class ACE_MicroDAGR_xMagazine: ACE_DK10Magazine { // temporary name change to not interfere with MicroDAGR module during integration
        descriptionShort = CSTRING(MicroDAGR_itemDescription);
        displayName = CSTRING(MicroDAGR_itemName);
        model = QUOTE(PATHTOF(data\MicroDAGR.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\MicroDAGR_icon.paa));
        mass = 6;
        EGVAR(bft,type) = "ACE_MicroDAGR_x";
    };*/
};
