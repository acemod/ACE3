
class CfgWeapons {

    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"ACE_Chemlight_OrangeMuzzle","ACE_Chemlight_WhiteMuzzle","ACE_Chemlight_HiRedMuzzle","ACE_Chemlight_HiYellowMuzzle","ACE_Chemlight_HiOrangeMuzzle","ACE_Chemlight_HiWhiteMuzzle","ACE_Chemlight_IRMuzzle"};

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
        class ACE_Chemlight_IRMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_Chemlight_IR"};
        };
    };

    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_Chemlight_Shield: ACE_ItemCore {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Shield_Empty_DisplayName);
        descriptionShort = CSTRING(Shield_Empty_DescriptionShort);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = QPATHTOF(UI\ace_chemlight_shield_x_ca.paa);
        scope = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };

    class ACE_Chemlight_Shield_Green: ACE_ItemCore {
        ACE_Chemlight = "Chemlight_green";
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(Shield_Green_DisplayName);
        descriptionShort = CSTRING(Shield_Green_DescriptionShort);
        model = "\A3\weapons_F\ammo\mag_univ.p3d";
        picture = QPATHTOF(UI\ace_chemlight_shield_green_x_ca.paa);
        scope = 1;
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "green";
                ACE_Flashlight_Beam = QPATHTOF(UI\chemlight_shield_beam_green_ca.paa);
                ACE_Flashlight_Size = 0.8;
            };
        };
    };

    class ACE_Chemlight_Shield_Red: ACE_Chemlight_Shield_Green {
        ACE_Chemlight = "Chemlight_red";
        displayName = CSTRING(Shield_Red_DisplayName);
        descriptionShort = CSTRING(Shield_Red_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_shield_red_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "red";
                ACE_Flashlight_Beam = QPATHTOF(UI\chemlight_shield_beam_red_ca.paa);
                ACE_Flashlight_Size = 0.8;
            };
        };
    };

    class ACE_Chemlight_Shield_Blue: ACE_Chemlight_Shield_Green {
        ACE_Chemlight = "Chemlight_blue";
        displayName = CSTRING(Shield_Blue_DisplayName);
        descriptionShort = CSTRING(Shield_Blue_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_shield_blue_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "blue";
                ACE_Flashlight_Beam = QPATHTOF(UI\chemlight_shield_beam_blue_ca.paa);
                ACE_Flashlight_Size = 0.8;
            };
        };
    };

    class ACE_Chemlight_Shield_Yellow: ACE_Chemlight_Shield_Green {
        ACE_Chemlight = "Chemlight_yellow";
        displayName = CSTRING(Shield_Yellow_DisplayName);
        descriptionShort = CSTRING(Shield_Yellow_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_shield_yellow_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "yellow";
                ACE_Flashlight_Beam = QPATHTOF(UI\chemlight_shield_beam_yellow_ca.paa);
                ACE_Flashlight_Size = 0.8;
            };
        };
    };

    class ACE_Chemlight_Shield_Orange: ACE_Chemlight_Shield_Green {
        ACE_Chemlight = "ACE_Chemlight_Orange";
        displayName = CSTRING(Shield_Orange_DisplayName);
        descriptionShort = CSTRING(Shield_Orange_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_shield_orange_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "orange";
                ACE_Flashlight_Beam = QPATHTOF(UI\chemlight_shield_beam_orange_ca.paa);
                ACE_Flashlight_Size = 0.8;
            };
        };
    };

    class ACE_Chemlight_Shield_White: ACE_Chemlight_Shield_Green {
        ACE_Chemlight = "ACE_Chemlight_White";
        displayName = CSTRING(Shield_White_DisplayName);
        descriptionShort = CSTRING(Shield_White_DescriptionShort);
        picture = QPATHTOF(UI\ace_chemlight_shield_white_x_ca.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
            class FlashLight {
                ACE_Flashlight_Colour = "white";
                ACE_Flashlight_Beam = QPATHTOF(UI\chemlight_shield_beam_white_ca.paa);
                ACE_Flashlight_Size = 0.8;
            };
        };
    };
};
