
class CfgGlasses {
    class G_Combat;
    class rhs_ess_black: G_Combat {
        ACE_Color[] = {0,0,0};
        ACE_TintAmount = 16.0;
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
        ACE_Resistance = 1;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOEF(goggles,textures\fx\dust\%1.paa);
    };
    class rhs_googles_black: G_Combat {
        ACE_Color[] = {0,0,0};
        ACE_TintAmount = 16.0;
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
        ACE_Resistance = 1;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOEF(goggles,textures\fx\dust\%1.paa);
    };
    class rhs_googles_clear: G_Combat {
        ACE_Color[] = {0,0,0};
        ACE_TintAmount = 0;
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
        ACE_Resistance = 1;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOEF(goggles,textures\fx\dust\%1.paa);
    };
    class rhs_googles_orange: G_Combat {
        ACE_Color[] = {1,0.5,0};
        ACE_TintAmount = 8.0;
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
        ACE_Resistance = 1;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOEF(goggles,textures\fx\dust\%1.paa);
    };
    class rhs_googles_yellow: G_Combat {
        ACE_Color[] = {0,0,-1.5};
        ACE_TintAmount = 8.0;
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
        ACE_Resistance = 1;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOEF(goggles,textures\fx\dust\%1.paa);
    };
    class rhsusf_oakley_goggles_base: G_Combat {
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
        ACE_Resistance = 1;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOEF(goggles,textures\fx\dust\%1.paa);
    };
    class rhsusf_oakley_goggles_blk: rhsusf_oakley_goggles_base {
        ACE_Color[] = {0,0,0};
        ACE_TintAmount = 16.0;
    };
    class rhsusf_oakley_goggles_clr: rhsusf_oakley_goggles_base {
        ACE_Color[] = {0,0,0};
        ACE_TintAmount = 0;
    };
    class rhsusf_oakley_goggles_ylw: rhsusf_oakley_goggles_base {
        ACE_Color[] = {0,0,-1.5};
        ACE_TintAmount = 8.0;
    };
    class rhsusf_shemagh_gogg_base: G_Combat {
        ACE_Color[] = {0,0,0};
        ACE_TintAmount = 16.0;
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
        ACE_Resistance = 1;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOEF(goggles,textures\fx\dust\%1.paa);
    };
    class rhsusf_shemagh2_gogg_base: G_Combat {
        ACE_Color[] = {0,0,0};
        ACE_TintAmount = 16.0;
        ACE_Overlay = "";
        ACE_OverlayDirt = "A3\Ui_f\data\igui\rsctitles\HealthTextures\dust_upper_ca.paa";
        ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
        ACE_Resistance = 1;
        ACE_Protection = 0;
        ACE_DustPath = QPATHTOEF(goggles,textures\fx\dust\%1.paa);
    };
    class rhsusf_shemagh_base: G_Combat {
        ACE_Overlay = "";
        ACE_OverlayDirt = "";
        ACE_OverlayCracked = "";
        ACE_Resistance = 0;
        ACE_Protection = 0;
        ACE_DustPath = "";
    };
    class rhsusf_shemagh2_base: G_Combat {
        ACE_Overlay = "";
        ACE_OverlayDirt = "";
        ACE_OverlayCracked = "";
        ACE_Resistance = 0;
        ACE_Protection = 0;
        ACE_DustPath = "";
    };
};
