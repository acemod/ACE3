class CfgWeapons {

    class ItemCore;
    class InventoryFlashlightItem_Base_F;

    class acc_flashlight: ItemCore {
        class ItemInfo: InventoryFlashlightItem_Base_F {
            class FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Beam = QPATHTOF(UI\Flashlight_beam_white_ca.paa);
                ACE_Flashlight_Size = DEFAULT_FLASHLIGHT_SIZE;
                ACE_Flashlight_Sound = 1;
            };
        };
    };
    class acc_flashlight_pistol: ItemCore {
        class ItemInfo: InventoryFlashlightItem_Base_F {
            class FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Beam = QPATHTOF(UI\Flashlight_beam_white_ca.paa);
                ACE_Flashlight_Size = DEFAULT_FLASHLIGHT_SIZE;
                ACE_Flashlight_Sound = 1;
            };
        };
    };
};
