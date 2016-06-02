class CfgWeapons {

    class ItemCore;
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    class InventoryFlashlightItem_Base_F;

    class acc_flashlight: ItemCore {
        class ItemInfo: InventoryFlashlightItem_Base_F {
            class ACE_Flashlight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Beam = QUOTE(PATHTOF(UI\Flashlight_beam_white_ca.paa));
                ACE_Flashlight_Size = 2.75;
                ACE_Flashlight_Sound = 1;
            };
        };
    };
};