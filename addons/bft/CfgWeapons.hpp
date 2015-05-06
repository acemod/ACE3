
class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    class ACE_bftItemBase: ACE_ItemCore {
        author = "$STR_ACE_Common_ACETeam";
        scope = 2;
        displayName = "BFT Base Item";
        descriptionShort = "";
        picture =  PATHTOF(data\icon_base.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;

        // Specify if this item has BFT enabled.
        GVAR(enabled) = 1;

        // Magazine type for unique IDs. This is the magazine classname by which this item will be replaced. Will be replaced once BI implements unique Ids for items.
        GVAR(magazineItem) = "ACE_bftMagazineBase";

        // What side this device is from.
        GVAR(deviceSide) = "west";

        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    class ACE_bft_vehicleDisplayBase: ACE_bftItemBase {
        scope = 1;
        scopeCurator = 0;

        // Specify if this item has BFT enabled.
        GVAR(enabled) = 1;

        // We dont have a replacement for this.
        GVAR(magazineItem) = "";

        // What side this device is from.
        GVAR(deviceSide) = "west";
    };

};
