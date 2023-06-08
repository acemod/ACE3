class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    class ACE_bftItemBase: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "BFT Base Item";
        descriptionShort = "";
        picture =  PATHTOF(data\icon_base.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;

        // Specify if this item has BFT enabled.
        GVAR(deviceType) = "FBCB2Device";
        // Magazine type for unique IDs. This is the magazine classname by which this item will be replaced. Will be replaced once BI implements unique Ids for items.
        GVAR(magazineItem) = "ACE_bftMagazineBase";

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
