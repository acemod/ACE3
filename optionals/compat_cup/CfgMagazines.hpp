class CfgMagazines {
    class CUP_M136_M;
    class CUP_RPG18_M;
    class CUP_NLAW_M;
    class ACE_PreloadedMissileDummy_CUP: CUP_M136_M {              // The dummy magazine
        author = "$STR_ACE_Common_ACETeam";
        scope = 1;
        scopeArsenal = 1;
        displayName = "Preloaded Missle";
        //displayName = "$STR_ACE_Disposable_PreloadedMissileDummy";
        picture = PATHTOEF(common,UI\blank_CO.paa);
        weaponPoolAvailable = 0;
        mass = 0;
    };
    class ACE_FiredMissileDummy_CUP: ACE_PreloadedMissileDummy_CUP {
        count = 0;
    };
    class ACE_UsedTube_M136_F: CUP_M136_M {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACE_Disposable_UsedTube";
        descriptionShort = "$STR_ACE_Disposable_UsedTubeDescription";
        displayNameShort = "-";
        count = 0;
        weaponPoolAvailable = 0;
        modelSpecial = "";
        mass = 0;
    };
    class ACE_UsedTube_RPG18_F: CUP_RPG18_M {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACE_Disposable_UsedTube";
        descriptionShort = "$STR_ACE_Disposable_UsedTubeDescription";
        displayNameShort = "-";
        count = 0;
        weaponPoolAvailable = 0;
        modelSpecial = "";
        mass = 0;
    };
    class ACE_UsedTube_NLAW_F: CUP_NLAW_M {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACE_Disposable_UsedTube";
        descriptionShort = "$STR_ACE_Disposable_UsedTubeDescription";
        displayNameShort = "-";
        count = 0;
        weaponPoolAvailable = 0;
        modelSpecial = "";
        mass = 0;
    };
    
    class CA_Magazine;
    class 30Rnd_556x45_Stanag;
    class CUP_30Rnd_545x39_AK_M: CA_Magazine {
        initSpeed = 880;
    };
    class CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M: CA_Magazine {
        initSpeed = 880;
    };
    class CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M: CA_Magazine {
        initSpeed = 880;
    };
    class CUP_30Rnd_TE1_White_Tracer_545x39_AK_M: CA_Magazine {
        initSpeed = 880;
    };
    class CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M: CA_Magazine {
        initSpeed = 880;
    };
    class CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M: CA_Magazine {
        initSpeed = 880;
    };
    class CUP_30Rnd_762x39_AK47_M: CA_Magazine {
        initSpeed = 750;
    };
    class CUP_64Rnd_9x19_Bizon_M: CA_Magazine {
        initSpeed = 350;
    };
    class CUP_64Rnd_Green_Tracer_9x19_Bizon_M: CA_Magazine {
        initSpeed = 350;
    };
    class CUP_64Rnd_Red_Tracer_9x19_Bizon_M: CA_Magazine {
        initSpeed = 350;
    };
    class CUP_64Rnd_White_Tracer_9x19_Bizon_M: CA_Magazine {
        initSpeed = 350;
    };
    class CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M: CA_Magazine {
        initSpeed = 350;
    };
    class CUP_5x_22_LR_17_HMR_M: CA_Magazine {
        initSpeed = 830;
    };
    class CUP_10x_303_M: CA_Magazine {
 		initSpeed = 765;
    };
    class CUP_20Rnd_762x51_FNFAL_M: CA_Magazine {
 		initSpeed = 833;
    };
    class CUP_5Rnd_127x108_KSVK_M: CA_Magazine {
        initSpeed = 820;
    };
    class CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M: CA_Magazine {
        initSpeed = 833;
    };
    class CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M: CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M {
        initSpeed = 833;
    };
    class CUP_200Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M: CA_Magazine {
        initSpeed = 833;
    };
    class CUP_200Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M: CA_Magazine {
        initSpeed = 833;
    };
    class CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M: CA_Magazine {
        initSpeed = 800;
    };
    class CUP_10Rnd_762x54_SVD_M: CA_Magazine {
        initSpeed = 800;
    };
    class CUP_10Rnd_9x39_SP5_VSS_M: CA_Magazine {
        initSpeed = 300;
    };
    class CUP_20Rnd_9x39_SP5_VSS_M: CA_Magazine {
        initSpeed = 300;
    };
    class CUP_5Rnd_127x99_as50_M: CA_Magazine {
        initSpeed = 900;
    };
    class CUP_20Rnd_762x51_DMR: CA_Magazine {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_Yellow_Tracer_762x51_DMR: CUP_20Rnd_762x51_DMR {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_Red_Tracer_762x51_DMR: CUP_20Rnd_762x51_DMR {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_Green_Tracer_762x51_DMR: CUP_20Rnd_762x51_DMR {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_White_Tracer_762x51_DMR: CUP_20Rnd_762x51_DMR {
        initSpeed = 833;
    };
    class CUP_20Rnd_762x51_B_SCAR: CA_Magazine {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR: CUP_20Rnd_762x51_B_SCAR {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR: CUP_20Rnd_762x51_B_SCAR {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR: CUP_20Rnd_762x51_B_SCAR {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_White_Tracer_762x51_SCAR: CUP_20Rnd_762x51_B_SCAR {
        initSpeed = 833;
    };
    class CUP_20Rnd_762x51_B_M110: CA_Magazine {
        initSpeed = 833;
    };
    class CUP_5Rnd_762x51_M24: CA_Magazine {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110: CUP_20Rnd_762x51_B_M110 {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_Red_Tracer_762x51_M110: CUP_20Rnd_762x51_B_M110 {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_Green_Tracer_762x51_M110: CUP_20Rnd_762x51_B_M110 {
        initSpeed = 833;
    };
    class CUP_20Rnd_TE1_White_Tracer_762x51_M110: CUP_20Rnd_762x51_B_M110 {
        initSpeed = 833;
    };
    class CUP_30Rnd_556x45_G36: 30Rnd_556x45_Stanag {
        initSpeed = 920;
    };
    class CUP_30Rnd_TE1_Red_Tracer_556x45_G36: CUP_30Rnd_556x45_G36 {
        initSpeed = 920;
    };
    class CUP_30Rnd_TE1_Green_Tracer_556x45_G36: CUP_30Rnd_556x45_G36 {
        initSpeed = 920;
    };
    class CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36: CUP_30Rnd_556x45_G36 {
        initSpeed = 920;
    };
    class CUP_100Rnd_556x45_BetaCMag: 30Rnd_556x45_Stanag {
        initSpeed = 920;
    };
    class CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag: CUP_100Rnd_556x45_BetaCMag {
        initSpeed = 920;
    };
    class CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag: CUP_100Rnd_556x45_BetaCMag {
        initSpeed = 920;
    };
    class CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag: CUP_100Rnd_556x45_BetaCMag {
        initSpeed = 920;
    };
    class CUP_200Rnd_TE4_Green_Tracer_556x45_M249: CA_Magazine {
        initSpeed = 920;
    };
    class CUP_200Rnd_TE4_Red_Tracer_556x45_M249: CUP_200Rnd_TE4_Green_Tracer_556x45_M249 {
        initSpeed = 920;
    };
    class CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249: CUP_200Rnd_TE4_Green_Tracer_556x45_M249 {
        initSpeed = 920;
    };
    class CUP_200Rnd_TE1_Red_Tracer_556x45_M249: CUP_200Rnd_TE4_Red_Tracer_556x45_M249 {
        initSpeed = 920;
    };
    class CUP_100Rnd_TE4_Green_Tracer_556x45_M249: CA_Magazine {
        initSpeed = 920;
    };
    class CUP_100Rnd_TE4_Red_Tracer_556x45_M249: CUP_100Rnd_TE4_Green_Tracer_556x45_M249 {
        initSpeed = 920;
    };
    class CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249: CUP_100Rnd_TE4_Green_Tracer_556x45_M249 {
        initSpeed = 920;
    };
    class CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1: CUP_200Rnd_TE4_Green_Tracer_556x45_M249 {
        initSpeed = 920;
    };
    class CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1: CUP_200Rnd_TE4_Red_Tracer_556x45_M249 {
        initSpeed = 920;
    };
    class CUP_200Rnd_TE4_Yellow_Tracer_556x45_L110A1: CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249 {
        initSpeed = 920;
    };
    class CUP_30Rnd_556x45_Stanag: CA_Magazine {
        initSpeed = 920;
    };
    class CUP_20Rnd_556x45_Stanag: CUP_30Rnd_556x45_Stanag {
        initSpeed = 920;
    };
    class CUP_10Rnd_127x99_M107: CA_Magazine {
        initSpeed = 900;
    };
    class CUP_10Rnd_762x51_CZ750: CA_Magazine {
        initSpeed = 833;
    };
    class CUP_10Rnd_762x51_CZ750_Tracer: CUP_10Rnd_762x51_CZ750 {
        initSpeed = 833;
    };
    class CUP_50Rnd_UK59_762x54R_Tracer: CA_Magazine {
        initSpeed = 800;
    };
    class CUP_8Rnd_9x18_Makarov_M: CA_Magazine {
        initSpeed = 300;
    };
    class CUP_8Rnd_9x18_MakarovSD_M: CUP_8Rnd_9x18_Makarov_M {
        initSpeed = 300;
    };
    class CUP_6Rnd_45ACP_M: CA_Magazine {
        initSpeed = 250;
    };
    class CUP_17Rnd_9x19_glock17: CA_Magazine {
        initSpeed = 370;
    };
    class CUP_5Rnd_86x70_L115A1: CA_Magazine {
        initSpeed = 915;
    };
    class CUP_20Rnd_B_765x17_Ball_M: CA_Magazine {
        initSpeed = 290;
    };
    class CUP_30Rnd_9x19_MP5: CA_Magazine {
        initSpeed = 400;
    };
};