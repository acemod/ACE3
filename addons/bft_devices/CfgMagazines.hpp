
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

    /*class ACE_MicroDAGR_xMagazine: ACE_DK10Magazine { // temporary name change to not interfere with MicroDAGR module during integration
        descriptionShort = CSTRING(MicroDAGR_itemDescription);
        displayName = CSTRING(MicroDAGR_itemName);
        model = QUOTE(PATHTOF(data\MicroDAGR.p3d));
        picture = QUOTE(PATHTOF(UI\inventory\MicroDAGR_icon.paa));
        mass = 6;
        EGVAR(bft,type) = "ACE_MicroDAGR_x";
    };*/
};
