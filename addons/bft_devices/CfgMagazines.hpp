
class CfgMagazines {
    class CA_magazine;
    class ACE_DK10Magazine: CA_magazine {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        descriptionShort = "$STR_ACE_BFT_Devices_DK10_itemDescription";
        descriptionUse = "";
        displayName = "$STR_ACE_BFT_Devices_DK10_itemName";
        picture = QUOTE(PATHTOF(UI\inventory\DK10_icon.paa));
        mass = 40;
        EGVAR(bft,type) = "ACE_DK10";
    };
    class ACE_GD300Magazine: ACE_DK10Magazine {
        descriptionShort = "$STR_ACE_BFT_Devices_GD300_itemDescription";
        displayName = "$STR_ACE_BFT_Devices_GD300_itemName";
        model = QUOTE(PATHTOF(data\GD300.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\GD300_icon.paa));
        mass = 5;
        EGVAR(bft,type) = "ACE_GD300";
    };

    class ACE_MicroDAGR_xMagazine: ACE_DK10Magazine { // temporary name change to not interfere with MicroDAGR module during integration
        descriptionShort = "$STR_ACE_BFT_Devices_MicroDAGR_itemDescription";
        displayName = "$STR_ACE_BFT_Devices_MicroDAGR_itemName";
        model = QUOTE(PATHTOF(data\MicroDAGR.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\MicroDAGR_icon.paa));
        mass = 6;
        EGVAR(bft,type) = "ACE_MicroDAGR_x";
    };
};
