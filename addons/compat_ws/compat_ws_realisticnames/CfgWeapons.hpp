class CfgWeapons {
    // AA12
    class sgun_aa40_base_lxWS;
    class sgun_aa40_lxWS: sgun_aa40_base_lxWS {
        displayName = CSTRING(AA40_Name);
    };
    class sgun_aa40_tan_lxWS: sgun_aa40_base_lxWS {
        displayName = CSTRING(AA40_Tan_Name);
    };
    class sgun_aa40_snake_lxWS: sgun_aa40_base_lxWS {
        displayName = CSTRING(AA40_Snake_Name);
    };

    // Galil ARM
    class arifle_Galat_base_lxWS;
    class arifle_Galat_lxWS: arifle_Galat_base_lxWS {
        displayName = CSTRING(Galat_Name);
    };
    class arifle_Galat_worn_lxWS: arifle_Galat_lxWS {
        displayName = CSTRING(Galat_Old_Name);
    };

    // GLX 160
    class glaunch_GLX_base_lxWS;
    class glaunch_GLX_lxWS: glaunch_GLX_base_lxWS {
        displayName = CSTRING(GLX_Name);
    };
    class glaunch_GLX_snake_lxWS: glaunch_GLX_base_lxWS {
        displayName = CSTRING(GLX_Snake_Name);
    };
    class glaunch_GLX_hex_lxWS: glaunch_GLX_base_lxWS {
        displayName = CSTRING(GLX_Hex_Name);
    };
    class glaunch_GLX_ghex_lxWS: glaunch_GLX_base_lxWS {
        displayName = CSTRING(GLX_GreenHex_Name);
    };
    class glaunch_GLX_camo_lxWS: glaunch_GLX_base_lxWS {
        displayName = CSTRING(GLX_Camo_Name);
    };
    class glaunch_GLX_tan_lxWS: glaunch_GLX_base_lxWS {
        displayName = CSTRING(GLX_Tan_Name);
    };

    // Mk14 Mod 1 EBR
    class srifle_EBR_F;
    class srifle_EBR_blk_lxWS: srifle_EBR_F {
        displayName = CSTRING(EBR_Black_Name);
    };
    class srifle_EBR_snake_lxWS: srifle_EBR_F {
        displayName = CSTRING(EBR_Snake_Name);
    };

    // Vektor SS-77
    class LMG_S77_base_lxWS;
    class LMG_S77_lxWS: LMG_S77_base_lxWS {
        displayName = CSTRING(S77_Name);
    };
    class LMG_S77_AAF_lxWS: LMG_S77_base_lxWS {
        displayName = CSTRING(S77_AAF_Name);
    };
    class LMG_S77_Hex_lxWS: LMG_S77_base_lxWS {
        displayName = CSTRING(S77_Hex_Name);
    };
    class LMG_S77_GHex_lxWS: LMG_S77_base_lxWS {
        displayName = CSTRING(S77_GreenHex_Name);
    };
    class LMG_S77_Desert_lxWS: LMG_S77_base_lxWS {
        displayName = CSTRING(S77_Desert_Name);
    };

    // Vektor SS-77 (Compact)
    class LMG_S77_Compact_base_lxWS;
    class LMG_S77_Compact_lxWS: LMG_S77_Compact_base_lxWS {
        displayName = CSTRING(S77_Compact_Name);
    };
    class LMG_S77_Compact_Snakeskin_lxWS: LMG_S77_Compact_base_lxWS {
        displayName = CSTRING(S77_Compact_Snake_Name);
    };

    // FN FAL (Wood) - Closest match is the 50.00
    class DMR_06_base_F;
    class arifle_SLR_lxWS: DMR_06_base_F {
        displayName = CSTRING(SLR_Wood_Name);
    };
    class arifle_SLR_GL_lxWS: arifle_SLR_lxWS {
        displayName = CSTRING(SLR_GL_Wood_Name);
    };

    // FN FAL
    class arifle_SLR_V_lxWS: arifle_SLR_lxWS {
        displayName = CSTRING(SLR_Name);
    };
    class arifle_SLR_V_GL_lxWS: arifle_SLR_V_lxWS {
        displayName = CSTRING(SLR_GL_Name);
    };
    class arifle_SLR_D_lxWS: arifle_SLR_lxWS {
        displayName = CSTRING(SLR_Desert_Name);
    };
    class arifle_SLR_V_camo_lxWS: arifle_SLR_V_lxWS {
        displayName = CSTRING(SLR_Camo_Name);
    };

    // Vektor R4/R5
    class arifle_Velko_base_lxWS;
    class arifle_Velko_lxWS: arifle_Velko_base_lxWS {
        displayName = CSTRING(Velko_R4_Name);
    };
    class arifle_VelkoR5_lxWS: arifle_Velko_base_lxWS {
        displayName = CSTRING(Velko_R5_Name);
    };
    class arifle_VelkoR5_GL_lxWS: arifle_VelkoR5_lxWS {
        displayName = CSTRING(Velko_R5_GL_Name);
    };
    class arifle_VelkoR5_snake_lxWS: arifle_VelkoR5_lxWS {
        displayName = CSTRING(Velko_R5_Snake_Name);
    };
    class arifle_VelkoR5_GL_snake_lxWS: arifle_VelkoR5_GL_lxWS {
        displayName = CSTRING(Velko_R5_GL_Snake_Name);
    };

    // XMS has not been added as it's a make believe hybrid of the XM8/VHS-K2: XM8+VHS = XMS
};
