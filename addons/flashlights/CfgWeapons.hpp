class CfgWeapons {

    class ItemCore;
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    class InventoryFlashlightItem_Base_F;

    class acc_flashlight: ItemCore {
        class ItemInfo: InventoryFlashlightItem_Base_F {
            class Flashlight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Size = 2.75;
            };
        };
    };

    class ACE_Flashlight_MX991: ACE_ItemCore {
        displayName = CSTRING(MX991_DisplayName);
        descriptionShort = CSTRING(MX991_Description);
        model = QUOTE(PATHTOF(data\MX_991.p3d));
        picture = PATHTOF(UI\mx991_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Size = 1.75;
            };
        };
    };

    class ACE_Flashlight_KSF1: ACE_ItemCore {
        displayName = CSTRING(KSF1_DisplayName);
        descriptionShort = CSTRING(KSF1_Description);
        model = QUOTE(PATHTOF(data\KSF_1.p3d));
        picture = PATHTOF(UI\ksf1_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Size = 1.5;
            };
        };
    };

    class ACE_Flashlight_XL50: ACE_ItemCore {
        displayName = CSTRING(XL50_DisplayName);
        descriptionShort = CSTRING(XL50_Description);
        model = QUOTE(PATHTOF(data\Maglight.p3d));
        picture = PATHTOF(UI\xl50_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Size = 2.15;
            };
        };
    };
};