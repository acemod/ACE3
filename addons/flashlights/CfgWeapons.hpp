class CfgWeapons {

    class ItemCore;
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    class InventoryFlashlightItem_Base_F;

    class acc_flashlight: ItemCore {
        class ItemInfo: InventoryFlashlightItem_Base_F {
            class ACE_Flashlight {
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
            class ACE_FlashLight {
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
            class ACE_FlashLight {
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
            class ACE_FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Size = 2.15;
            };
        };
    };
    
    class ACE_Chemlight_Shield: ACE_ItemCore {
        displayName = "Chemlight Shield (Empty)";
        descriptionShort = "Shield for chemlights. Combine with chemlight to create reading light.";
        model = QUOTE(PATHTOF(data\Maglight.p3d));
        picture = PATHTOF(UI\ace_chemlight_shield_x_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    
    class ACE_Chemlight_Shield_Green: ACE_ItemCore {
        displayName = "Chemlight Shield (Green)";
        descriptionShort = "Green reading light.";
        model = QUOTE(PATHTOF(data\Maglight.p3d));
        picture = PATHTOF(UI\ace_chemlight_shield_green_x_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
            class ACE_FlashLight {
                ACE_Flashlight_Colour = "green";
                ACE_Flashlight_Size = 1;
                ACE_Flashlight_NoSound = 1;
            };
        };
    };
    
    class ACE_Chemlight_Shield_Red: ACE_Chemlight_Shield_Green {
        displayName = "Chemlight Shield (Red)";
        descriptionShort = "Red reading light.";
        picture = PATHTOF(UI\ace_chemlight_shield_red_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
            class ACE_FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Size = 1;
                ACE_Flashlight_NoSound = 1;
            };
        };
    };

    class ACE_Chemlight_Shield_Blue: ACE_Chemlight_Shield_Green {
        displayName = "Chemlight Shield (Blue)";
        descriptionShort = "Blue reading light.";
        picture = PATHTOF(UI\ace_chemlight_shield_blue_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
            class ACE_FlashLight {
                ACE_Flashlight_Colour = "blue";
                ACE_Flashlight_Size = 1;
                ACE_Flashlight_NoSound = 1;
            };
        };
    };
    
    class ACE_Chemlight_Shield_Yellow: ACE_Chemlight_Shield_Green {
        displayName = "Chemlight Shield (Yellow)";
        descriptionShort = "Yellow reading light.";
        picture = PATHTOF(UI\ace_chemlight_shield_blue_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
            class ACE_FlashLight {
                ACE_Flashlight_Colour = "yellow";
                ACE_Flashlight_Size = 1;
                ACE_Flashlight_NoSound = 1;
            };
        };
    };
    
    class ACE_Chemlight_Shield_Orange: ACE_Chemlight_Shield_Green {
        displayName = "Chemlight Shield (Orange)";
        descriptionShort = "Orange reading light.";
        picture = PATHTOF(UI\ace_chemlight_shield_orange_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
            class ACE_FlashLight {
                ACE_Flashlight_Colour = "orange";
                ACE_Flashlight_Size = 1;
                ACE_Flashlight_NoSound = 1;
            };
        };
    };

    class ACE_Chemlight_Shield_White: ACE_Chemlight_Shield_Green {
        displayName = "Chemlight Shield (White)";
        descriptionShort = "White reading light.";
        picture = PATHTOF(UI\ace_chemlight_shield_white_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
            class ACE_FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Size = 1;
                ACE_Flashlight_NoSound = 1;
            };
        };
    };
};