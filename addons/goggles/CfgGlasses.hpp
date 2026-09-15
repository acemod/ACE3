class CfgGlasses {
    class None {
        ACE_Color[] = {0, 0, 0};
        ACE_TintAmount = 0;
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOF(textures\HUD\Cracked.paa);
        ACE_Resistance = 0;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOF(textures\fx\dust\%1.paa);
    };

    class G_Blindfold_01_base_F: None {
        ACE_Overlay = QPATHTOF(textures\HUD\blindfold_ca.paa);
        ACE_OverlayCracked = "";
        ACE_Resistance = 2;
        ACE_Protection = 1;
    };

    class G_Combat: None {
        COMBAT_GOGGLES;
    };

    class G_Combat_Goggles_tna_F: None {
        COMBAT_GOGGLES;
    };

    class G_Diving {
        ACE_Overlay = QPATHTOF(textures\HUD\DivingGoggles.paa);
        ACE_OverlayCracked = QPATHTOF(textures\HUD\DivingGogglesCracked.paa);
        ACE_Resistance = 2;
        ACE_Protection = 1;
    };

    class G_Lowprofile: None {
        ACE_TintAmount = COLOUR*2;
        ACE_Resistance = 2;
        ACE_Protection = 1;
    };

    class G_Shades_Black: None {
        ACE_TintAmount = COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Shades_Blue: None {
        ACE_Color[] = {0, 0, 1};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Shades_Green: None {
        ACE_Color[] = {0, 1, 0};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Shades_Red: None {
        ACE_Color[] = {1, 0, 0};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Spectacles: None {
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Spectacles_Tinted: None {
        ACE_TintAmount = COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Sport_Blackred: None {
        ACE_Color[] = {1, 0, 0};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Sport_BlackWhite: None {
        ACE_Color[] = {0, 0, 1};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Sport_Blackyellow: None {
        ACE_TintAmount = COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Sport_Checkered: None {
        ACE_TintAmount = COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Sport_Greenblack: None {
        ACE_TintAmount = COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Sport_Red: None {
        ACE_TintAmount = COLOUR*2;
        ACE_Color[] = {0, 0, 0};
        ACE_Resistance = 1;
    };

    class G_Squares: None {
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Squares_Tinted: None {
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Tactical_Black: None {
        ACE_TintAmount = COLOUR;
        ACE_Color[] = {0, 0, -1.5};
        ACE_Resistance = 1;
    };

    class G_Tactical_Clear: None {
        ACE_TintAmount = COLOUR;
        ACE_Color[] = {0, 0, -1};
        ACE_Resistance = 1;
    };

    class G_Aviator: None {
        ACE_Color[] = {0, 0, -1};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Lady_Blue: None {
        ACE_Color[] = {0, 0, 1};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Lady_Red: None {
        ACE_Color[] = {1, 0, 0};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Lady_Dark: None {
        ACE_TintAmount = COLOUR*2;
        ACE_Resistance = 1;
    };

    class G_Lady_Mirror: None {
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
    };

    class G_Balaclava_blk;

    class G_Balaclava_combat: G_Balaclava_blk {
        COMBAT_GOGGLES;
    };

    class G_Balaclava_lowprofile: G_Balaclava_blk {
        ACE_TintAmount = COLOUR*2;
        ACE_Resistance = 2;
        ACE_Protection = 1;
    };

    class G_Balaclava_TI_blk_F;
    class G_Balaclava_TI_G_blk_F: G_Balaclava_TI_blk_F {
        COMBAT_GOGGLES;
    };

    class G_Balaclava_TI_tna_F;
    class G_Balaclava_TI_G_tna_F: G_Balaclava_TI_tna_F {
        COMBAT_GOGGLES;
    };

    class G_Bandanna_blk;
    class G_Bandanna_shades: G_Bandanna_blk {
        ACE_TintAmount = COLOUR*2;
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };
    class G_Bandanna_sport: G_Bandanna_shades {
        ACE_Color[] = {1, 0, 0};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };
    class G_Bandanna_aviator: G_Bandanna_shades {
        ACE_Color[] = {0, 0, -1};
        ACE_TintAmount = COLOUR;
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };

    class G_EyeProtectors_base_F;
    class G_EyeProtectors_F: G_EyeProtectors_base_F {
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };
    class G_EyeProtectors_Earpiece_F: G_EyeProtectors_base_F {
        ACE_Resistance = 1;
        ACE_Protection = 1;
    };

    class G_AirPurifyingRespirator_01_base_F: None {
        ACE_Overlay = "a3\ui_f_enoch\data\objects\data\optics_apr_ca.paa";
        ACE_OverlayCracked = "";
        ACE_Resistance = 2;
        ACE_Protection = 1;
        ACE_Overlay_Angle = 180;
    };
    class G_AirPurifyingRespirator_02_base_F: G_AirPurifyingRespirator_01_base_F {
        ACE_Overlay = "a3\ui_f_enoch\data\objects\data\optics_APR_02_CA.paa";
    };
    class G_RegulatorMask_base_F: None {
        ACE_Overlay = "a3\ui_f_enoch\data\objects\data\optics_regulator_ca.paa";
        ACE_OverlayCracked = "";
        ACE_Overlay_Angle = 180;
    };
};
