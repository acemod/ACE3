#define COMBAT_GOGGLES         ACE_Overlay = QPATHTOEF(goggles,textures\HUD\CombatGoggles.paa); \
        ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\CombatGogglesCracked.paa); \
        ACE_Resistance = 2; \
        ACE_Protection = 1;

class CfgGlasses {
    class SPE_Glasses;
    class G_SPE_Dust_Goggles_2: SPE_Glasses {
        ACE_TintAmount = 16;
        COMBAT_GOGGLES
    };
    class G_SPE_Dust_Goggles: SPE_Glasses {
        ACE_TintAmount = 8;
        COMBAT_GOGGLES
    };
    class G_SPE_SWDG_Goggles: SPE_Glasses {
        COMBAT_GOGGLES
    };
    class G_SPE_Polar_Goggles: SPE_Glasses {
        COMBAT_GOGGLES
    };
    class G_SPE_Sunglasses_GER_Brown: SPE_Glasses {
        ACE_TintAmount = 16;
        ACE_Resistance = 1;
    };
    class G_SPE_Sunglasses_GER_Red: SPE_Glasses {
        ACE_TintAmount = 16;
        ACE_Resistance = 1;
    };
    class G_SPE_Sunglasses_US_Red: SPE_Glasses {
        ACE_TintAmount = 16;
        ACE_Resistance = 1;
    };
    class G_SPE_Sunglasses_US_Yellow: SPE_Glasses {
        ACE_TintAmount = 16;
        ACE_Resistance = 1;
    };
};
