class CfgWeapons {

    class ItemCore;
    class InventoryFlashlightItem_Base_F;

    class acc_flashlight: ItemCore {
        class ItemInfo: InventoryFlashlightItem_Base_F {
            class ACE_Map_Flashlight {
                ACE_Map_Flashlight_Color = "white";
                ACE_Map_Flashlight_Beam = QUOTE(PATHTOF(UI\Flashlight_beam_white_ca.paa));
                ACE_Map_Flashlight_Size = 2.75;
                ACE_Map_Flashlight_Sound = 1;
            };
        };
    };
};