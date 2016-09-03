
class CfgMagazines {
    class CA_magazine;
    class ACE_bftMagazineBase: CA_magazine {
        scope = 2;
        value = 1;
        count = 1;
        type = 16;
        displayName = "BFT Base Magazine";
        picture =  PATHTOF(data\icon_base.paa);
        descriptionShort = "";
        descriptionUse = "";
        mass = 1;

        // classname of the item entry, for easily identifying the device type
        GVAR(type) = "ACE_bftItemBase";
    };
};
