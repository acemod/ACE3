
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

        GVAR(enabled) = 1;
        GVAR(magazineItem) = "ACE_bftMagazineBase";

        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

};