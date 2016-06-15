class CfgWeapons {

    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_Flashlight_MX991: ACE_ItemCore {
        displayName = CSTRING(MX991_DisplayName);
        descriptionShort = CSTRING(MX991_Description);
        model = QPATHTOF(data\MX_991.p3d);
        picture = QPATHTOF(UI\mx991_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Beam = QPATHTOF(UI\Flashlight_beam_red_ca.paa);
                ACE_Flashlight_Size = 1.75;
                ACE_Flashlight_Sound = 1;
            };
        };
    };

    class ACE_Flashlight_KSF1: ACE_ItemCore {
        displayName = CSTRING(KSF1_DisplayName);
        descriptionShort = CSTRING(KSF1_Description);
        model = QPATHTOF(data\KSF_1.p3d);
        picture = QPATHTOF(UI\ksf1_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Beam = QPATHTOF(UI\Flashlight_beam_red_ca.paa);
                ACE_Flashlight_Size = 1.5;
                ACE_Flashlight_Sound = 1;
            };
        };
    };

    class ACE_Flashlight_XL50: ACE_ItemCore {
        displayName = CSTRING(XL50_DisplayName);
        descriptionShort = CSTRING(XL50_Description);
        model = QPATHTOF(data\Maglight.p3d);
        picture = QPATHTOF(UI\xl50_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Beam = QPATHTOF(UI\Flashlight_beam_white_ca.paa);
                ACE_Flashlight_Size = 2.15;
                ACE_Flashlight_Sound = 1;
            };
        };
    };
};