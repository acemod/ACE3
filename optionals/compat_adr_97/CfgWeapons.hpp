class CfgWeapons {

    class Rifle_Base_F;
    class SMG_03_TR_BASE: Rifle_Base_F {
        ACE_barrelTwist = 228.6; // 1:9 inch twist
        ACE_barrelLength = 407;
        ACE_twistDirection = 1;
        modes[]= {
            "Single"
        };
    };
    class SMG_03_TR_black: SMG_03_TR_BASE{
        displayName = CSTRING(PS90_TR_Black_Name);
    };
    class SMG_03_TR_khaki: SMG_03_TR_black {
        displayName = CSTRING(PS90_TR_Khaki_Name);
    };
    class SMG_03_TR_camo: SMG_03_TR_black {
        displayName = CSTRING(PS90_TR_Camo_Name);
    };
    class SMG_03_TR_hex: SMG_03_TR_BASE {
        displayName = CSTRING(PS90_TR_Hex_Name);
    };
    class SMG_03_black: SMG_03_TR_BASE {
        displayName = CSTRING(PS90_Black_Name);
    };
    class SMG_03_khaki: SMG_03_black {
        displayName = CSTRING(PS90_Khaki_Name);
    };
    class SMG_03_camo: SMG_03_black {
        displayName = CSTRING(PS90_Camo_Name);
    };
    class SMG_03_hex: SMG_03_black {
        displayName = CSTRING(PS90_Hex_Name);
    };
    class SMG_03C_BASE: SMG_03_TR_BASE {
        ACE_barrelLength = 264;
        modes[]= {
            "Single",
            "FullAuto"
        };
    };
    class SMG_03C_TR_black: SMG_03C_BASE {
        displayName = CSTRING(P90_TR_Black_Name);
    };
    class SMG_03C_TR_khaki: SMG_03C_TR_black {
        displayName = CSTRING(P90_TR_Khaki_Name);
    };
    class SMG_03C_TR_camo: SMG_03C_TR_black {
        displayName = CSTRING(P90_TR_Camo_Name);
    };
    class SMG_03C_TR_hex: SMG_03C_TR_black {
        displayName = CSTRING(P90_TR_Hex_Name);
    };
    class SMG_03C_black: SMG_03C_Base {
        displayName = CSTRING(P90_Black_Name);
    };
    class SMG_03C_khaki: SMG_03C_black {
        displayName = CSTRING(P90_Khaki_Name);
    };
    class SMG_03C_camo: SMG_03C_black {
        displayName = CSTRING(P90_Camo_Name);
    };
    class SMG_03C_hex: SMG_03C_black {
        displayName = CSTRING(P90_Hex_Name);
    };
};
