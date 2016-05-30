
class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"ACE_Chemlight_OrangeMuzzle","ACE_Chemlight_WhiteMuzzle","ACE_Chemlight_HiRedMuzzle","ACE_Chemlight_HiYellowMuzzle","ACE_Chemlight_HiOrangeMuzzle","ACE_Chemlight_HiWhiteMuzzle","ACE_Chemlight_HiRedMuzzle"};

        class ThrowMuzzle;
        
        class ACE_Chemlight_OrangeMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_Orange"};
        };
        
        class ACE_Chemlight_WhiteMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_White"};
        };
        
        class ACE_Chemlight_HiRedMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_HiRed"};
        };
        
        class ACE_Chemlight_HiYellowMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_HiYellow"};
        };
        
        class ACE_Chemlight_HiOrangeMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_HiOrange"};
        };
        
        class ACE_Chemlight_HiWhiteMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_HiWhite"};
        };
        /*
        class ACE_Chemlight_IRMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_IR"};
        };
        */
    };
    
    class ACE_ItemCore;
    class InventoryItem_Base_F;
    
    class ACE_Chemlight_Shield: ACE_ItemCore {
        displayName = "Chemlight Shield (Empty)";
        descriptionShort = "Shield for chemlights. Combine with chemlight to create reading light.";
        model = "\A3\Weapons_F\DummyItem.p3d";
        picture = PATHTOF(UI\ace_chemlight_shield_x_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
    
    class ACE_Chemlight_Shield_Green: ACE_ItemCore {
        displayName = "Chemlight Shield (Green)";
        descriptionShort = "Green reading light.";
        model = "\A3\Weapons_F\DummyItem.p3d";
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
                ACE_Flashlight_Size = 1.5;
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
                ACE_Flashlight_Size = 1.5;
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
                ACE_Flashlight_Size = 1.5;
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
                ACE_Flashlight_Size = 1.5;
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
                ACE_Flashlight_Size = 1.5;
                ACE_Flashlight_NoSound = 1;
            };
        };
    };
};
