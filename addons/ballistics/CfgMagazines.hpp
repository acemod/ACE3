
class CfgMagazines {

    class CA_Magazine;
    class VehicleMagazine;
    
    class 30Rnd_580x42_Mag_F: CA_Magazine {
        initSpeed = 950;
    };
    class 20Rnd_650x39_Cased_Mag_F: CA_Magazine {
        initSpeed = 806;
    };
    class 30Rnd_65x39_caseless_mag: CA_Magazine {
        initSpeed = 774;
    };
    class 30Rnd_65x39_caseless_green: 30Rnd_65x39_caseless_mag {
        initSpeed = 788;
    };
    class 100Rnd_65x39_caseless_mag: CA_Magazine {
        initSpeed = 774;
    };
    class 100Rnd_65x39_caseless_mag_Tracer;
    class ACE_100Rnd_65x39_caseless_mag_Tracer_Dim: 100Rnd_65x39_caseless_mag_Tracer {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_65x39_Caseless_Tracer_Dim";
        displayName = CSTRING(100Rnd_65x39_caseless_mag_Tracer_DimName);
        displayNameShort = CSTRING(100Rnd_65x39_caseless_mag_Tracer_DimNameShort);
        descriptionShort = CSTRING(100Rnd_65x39_caseless_mag_Tracer_DimDescription);
        picture = "\A3\weapons_f\data\ui\m_100rnd_65x39_yellow_ca.paa";
    };
    class 200Rnd_65x39_cased_Box: 100Rnd_65x39_caseless_mag {
        initSpeed = 743;
    };
    class ACE_200Rnd_65x39_cased_Box_Tracer_Dim: 200Rnd_65x39_cased_Box {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_65x39_Caseless_Tracer_Dim";
        displayName = CSTRING(200Rnd_65x39_cased_Box_Tracer_DimName);
        displayNameShort = CSTRING(200Rnd_65x39_cased_Box_Tracer_DimNameShort);
        descriptionShort = CSTRING(200Rnd_65x39_cased_Box_Tracer_DimDescription);
        picture = "\A3\weapons_f\data\ui\m_200rnd_65x39_yellow_ca.paa";
        initSpeed = 774;
    };
    class 30Rnd_65x39_caseless_mag_Tracer;
    class ACE_30Rnd_65x39_caseless_mag_Tracer_Dim: 30Rnd_65x39_caseless_mag_Tracer {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_65x39_Caseless_Tracer_Dim";
        displayName = CSTRING(30Rnd_65x39_caseless_mag_Tracer_DimName);
        displayNameShort = CSTRING(30Rnd_65x39_caseless_mag_Tracer_DimNameShort);
        descriptionShort = CSTRING(30Rnd_65x39_caseless_mag_Tracer_DimDescription);
    };
    class 30Rnd_65x39_caseless_green_mag_Tracer;
    class ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim: 30Rnd_65x39_caseless_green_mag_Tracer {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_65x39_Caseless_green_Tracer_Dim";
        displayName = CSTRING(30Rnd_65x39_caseless_green_mag_Tracer_DimName);
        displayNameShort = CSTRING(30Rnd_65x39_caseless_green_mag_Tracer_DimNameShort);
        descriptionShort = CSTRING(30Rnd_65x39_caseless_green_mag_Tracer_DimDescription);
    };

    class 30Rnd_545x39_Mag_F: CA_Magazine {
        initSpeed = 735;
    };
    
    class 30Rnd_556x45_Stanag: CA_Magazine {
        initSpeed = 909;
    };
    class 30Rnd_556x45_Stanag_green: 30Rnd_556x45_Stanag {
        initSpeed = 869;
    };
    class 30Rnd_556x45_Stanag_red: 30Rnd_556x45_Stanag {
        initSpeed = 869;
    };
    class 30Rnd_556x45_Stanag_Tracer_Red: 30Rnd_556x45_Stanag {
        initSpeed = 869;
    };
    class 30Rnd_556x45_Stanag_Tracer_Green: 30Rnd_556x45_Stanag {
        initSpeed = 869;
    };
    class 30Rnd_556x45_Stanag_Tracer_Yellow: 30Rnd_556x45_Stanag {
        initSpeed = 889;
    };
    class ACE_30Rnd_556x45_Stanag_M995_AP_mag: 30Rnd_556x45_Stanag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_556x45_Ball_M995_AP";
        displayName = CSTRING(30Rnd_556x45_Stanag_M995_AP_mag_Name);
        displayNameShort = CSTRING(30Rnd_556x45_Stanag_M995_AP_mag_NameShort);
        descriptionShort = CSTRING(30Rnd_556x45_Stanag_M995_AP_mag_Description);
        initSpeed = 875;
    };
    class ACE_30Rnd_556x45_Stanag_Mk262_mag: 30Rnd_556x45_Stanag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_556x45_Ball_Mk262";
        displayName = CSTRING(30Rnd_556x45_Stanag_Mk262_mag_Name);
        displayNameShort = CSTRING(30Rnd_556x45_Stanag_Mk262_mag_NameShort);
        descriptionShort = CSTRING(30Rnd_556x45_Stanag_Mk262_mag_Description);
        initSpeed = 832;
    };
    class ACE_30Rnd_556x45_Stanag_Mk318_mag: 30Rnd_556x45_Stanag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_556x45_Ball_Mk318";
        displayName = CSTRING(30Rnd_556x45_Stanag_Mk318_mag_Name);
        displayNameShort = CSTRING(30Rnd_556x45_Stanag_Mk318_mag_NameShort);
        descriptionShort = CSTRING(30Rnd_556x45_Stanag_Mk318_mag_Description);
        initSpeed = 923;
    };
    class ACE_30Rnd_556x45_Stanag_Tracer_Dim: 30Rnd_556x45_Stanag_Tracer_Red {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_B_556x45_Ball_Tracer_Dim";
        displayName = CSTRING(30Rnd_556x45_mag_Tracer_DimName);
        displayNameShort = CSTRING(30Rnd_556x45_mag_Tracer_DimNameShort);
        descriptionShort = CSTRING(30Rnd_556x45_mag_Tracer_DimDescription);
        picture = "\A3\weapons_f\data\ui\m_20stanag_red_ca.paa";
    };

    class 200Rnd_556x45_Box_F: CA_Magazine {
        initSpeed = 889;
    };
    class 200Rnd_556x45_Box_Red_F: 200Rnd_556x45_Box_F {
        initSpeed = 869;
    };
    
    class 30Rnd_762x39_Mag_F: CA_Magazine {
        initSpeed = 716;
    };
    
    class 20Rnd_762x51_Mag: CA_Magazine {
        initSpeed = 827;
    };
    class 10Rnd_762x51_Mag: 20Rnd_762x51_Mag {
        initSpeed = 833;
    };
    class 150Rnd_762x51_Box: CA_Magazine {
        initSpeed = 833;
    };
    class 150Rnd_762x51_Box_Tracer: 150Rnd_762x51_Box {
        initSpeed = 833;
    };
    class ACE_20Rnd_762x51_Mag_Tracer: 20Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "B_762x51_Tracer_Red";
        displayName = CSTRING(20Rnd_762x51_mag_TracerName);
        displayNameShort = CSTRING(20Rnd_762x51_mag_TracerNameShort);
        descriptionShort = CSTRING(20Rnd_762x51_mag_TracerDescription);
        tracersEvery = 1;
    };

    class ACE_20Rnd_762x51_Mag_Tracer_Dim: ACE_20Rnd_762x51_Mag_Tracer {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_B_762x51_Tracer_Dim";
        displayName = CSTRING(20Rnd_762x51_mag_Tracer_DimName);
        displayNameShort = CSTRING(20Rnd_762x51_mag_Tracer_DimNameShort);
        descriptionShort = CSTRING(20Rnd_762x51_mag_Tracer_DimDescription);
    };

    class ACE_20Rnd_762x51_Mag_SD: 20Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x51_Ball_Subsonic";
        displayName = CSTRING(20Rnd_762x51_mag_SDName);
        displayNameShort = CSTRING(20Rnd_762x51_mag_SDNameShort);
        descriptionShort = CSTRING(20Rnd_762x51_mag_SDDescription);
        initSpeed = 330;
    };

    class ACE_10Rnd_762x51_M118LR_Mag: 10Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x51_Ball_M118LR";
        count = 10;
        displayName = CSTRING(10Rnd_762x51_M118LR_Mag_Name);
        displayNameShort = CSTRING(10Rnd_762x51_M118LR_Mag_NameShort);
        descriptionShort = CSTRING(10Rnd_762x51_M118LR_Mag_Description);
        initSpeed = 780;
    };
    class ACE_10Rnd_762x51_Mk316_Mod_0_Mag: 10Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x51_Ball_Mk316_Mod_0";
        count = 10;
        displayName = CSTRING(10Rnd_762x51_Mk316_Mod_0_Mag_Name);
        displayNameShort = CSTRING(10Rnd_762x51_Mk316_Mod_0_Mag_NameShort);
        descriptionShort = CSTRING(10Rnd_762x51_Mk316_Mod_0_Mag_Description);
        initSpeed = 790;
    };
    class ACE_10Rnd_762x51_Mk319_Mod_0_Mag: 10Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x51_Ball_Mk319_Mod_0";
        count = 10;
        displayName = CSTRING(10Rnd_762x51_Mk319_Mod_0_Mag_Name);
        displayNameShort = CSTRING(10Rnd_762x51_Mk319_Mod_0_Mag_NameShort);
        descriptionShort = CSTRING(10Rnd_762x51_Mk319_Mod_0_Mag_Description);
        initSpeed = 900;
    };
    class ACE_10Rnd_762x51_M993_AP_Mag: 10Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x51_Ball_M993_AP";
        count = 10;
        displayName = CSTRING(10Rnd_762x51_M993_AP_Mag_Name);
        displayNameShort = CSTRING(10Rnd_762x51_M993_AP_Mag_NameShort);
        descriptionShort = CSTRING(10Rnd_762x51_M993_AP_Mag_Description);
        initSpeed = 920;
    };
    class ACE_20Rnd_762x51_M118LR_Mag: 20Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x51_Ball_M118LR";
        displayName = CSTRING(20Rnd_762x51_M118LR_Mag_Name);
        displayNameShort = CSTRING(20Rnd_762x51_M118LR_Mag_NameShort);
        descriptionShort = CSTRING(20Rnd_762x51_M118LR_Mag_Description);
        initSpeed = 785;
    };
    class ACE_20Rnd_762x51_Mk316_Mod_0_Mag: 20Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x51_Ball_Mk316_Mod_0";
        count = 20;
        displayName = CSTRING(20Rnd_762x51_Mk316_Mod_0_Mag_Name);
        displayNameShort = CSTRING(20Rnd_762x51_Mk316_Mod_0_Mag_NameShort);
        descriptionShort = CSTRING(20Rnd_762x51_Mk316_Mod_0_Mag_Description);
        initSpeed = 798;
    };
    class ACE_20Rnd_762x51_Mk319_Mod_0_Mag: 20Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x51_Ball_Mk319_Mod_0";
        displayName = CSTRING(20Rnd_762x51_Mk319_Mod_0_Mag_Name);
        displayNameShort = CSTRING(20Rnd_762x51_Mk319_Mod_0_Mag_NameShort);
        descriptionShort = CSTRING(20Rnd_762x51_Mk319_Mod_0_Mag_Description);
        initSpeed = 910;
    };
    class ACE_20Rnd_762x51_M993_AP_Mag: 20Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x51_Ball_M993_AP";
        count = 20;
        displayName = CSTRING(20Rnd_762x51_M993_AP_Mag_Name);
        displayNameShort = CSTRING(20Rnd_762x51_M993_AP_Mag_NameShort);
        descriptionShort = CSTRING(20Rnd_762x51_M993_AP_Mag_Description);
        initSpeed = 930;
    };
    class ACE_20Rnd_762x67_Mk248_Mod_0_Mag: 20Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x67_Ball_Mk248_Mod_0";
        displayName = CSTRING(20Rnd_762x67_Mk248_Mod_0_Mag_Name);
        displayNameShort = CSTRING(20Rnd_762x67_Mk248_Mod_0_Mag_NameShort);
        descriptionShort = CSTRING(20Rnd_762x67_Mk248_Mod_0_Mag_Description);
        initSpeed = 865;
    };
    class ACE_20Rnd_762x67_Mk248_Mod_1_Mag: 20Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x67_Ball_Mk248_Mod_1";
        displayName = CSTRING(20Rnd_762x67_Mk248_Mod_1_Mag_Name);
        displayNameShort = CSTRING(20Rnd_762x67_Mk248_Mod_1_Mag_NameShort);
        descriptionShort = CSTRING(20Rnd_762x67_Mk248_Mod_1_Mag_Description);
        initSpeed = 847;
    };
    class ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag: 20Rnd_762x51_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x67_Ball_Berger_Hybrid_OTM";
        displayName = CSTRING(20Rnd_762x67_Berger_Hybrid_OTM_Mag_Name);
        displayNameShort = CSTRING(20Rnd_762x67_Berger_Hybrid_OTM_Mag_NameShort);
        descriptionShort = CSTRING(20Rnd_762x67_Berger_Hybrid_OTM_Mag_Description);
        initSpeed = 800;
    };
    class ACE_30Rnd_65x47_Scenar_mag: 30Rnd_65x39_caseless_mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_65x47_Ball_Scenar";
        initSpeed = 826;
        displayName = CSTRING(30Rnd_65x47_Scenar_mag_Name);
        displayNameShort = CSTRING(30Rnd_65x47_Scenar_mag_NameShort);
        descriptionShort = CSTRING(30Rnd_65x47_Scenar_mag_Description);
    };
    class ACE_20Rnd_65x47_Scenar_mag: 20Rnd_650x39_Cased_Mag_F {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_65x47_Ball_Scenar";
        initSpeed = 826;
        displayName = CSTRING(20Rnd_65x47_Scenar_mag_Name);
        displayNameShort = CSTRING(20Rnd_65x47_Scenar_mag_NameShort);
        descriptionShort = CSTRING(20Rnd_65x47_Scenar_mag_Description);
    };
    class ACE_30Rnd_65_Creedmor_mag: 30Rnd_65x39_caseless_mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_65_Creedmor_Ball";
        initSpeed = 857;
        displayName = CSTRING(30Rnd_65_Creedmor_mag_Name);
        displayNameShort = CSTRING(30Rnd_65_Creedmor_mag_NameShort);
        descriptionShort = CSTRING(30Rnd_65_Creedmor_mag_Description);
    };
    class ACE_20Rnd_65_Creedmor_mag: 20Rnd_650x39_Cased_Mag_F {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_65_Creedmor_Ball";
        initSpeed = 857;
        displayName = CSTRING(20Rnd_65_Creedmor_mag_Name);
        displayNameShort = CSTRING(20Rnd_65_Creedmor_mag_NameShort);
        descriptionShort = CSTRING(20Rnd_65_Creedmor_mag_Description);
    };
    class 10Rnd_338_Mag: CA_Magazine {
        initSpeed = 880;
    };
    class ACE_10Rnd_338_300gr_HPBT_Mag: 10Rnd_338_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_338_Ball";
        displayName = CSTRING(10Rnd_338_300gr_HPBT_Mag_Name);
        displayNameShort = CSTRING(10Rnd_338_300gr_HPBT_Mag_NameShort);
        descriptionShort = CSTRING(10Rnd_338_300gr_HPBT_Mag_Description);
        initSpeed = 800;
    };
    class ACE_10Rnd_338_API526_Mag: 10Rnd_338_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_338_Ball_API526";
        displayName = CSTRING(10Rnd_338_API526_Mag_Name);
        displayNameShort = CSTRING(10Rnd_338_API526_Mag_NameShort);
        descriptionShort = CSTRING(10Rnd_338_API526_Mag_Description);
        initSpeed = 880;
    };
    
    class 7Rnd_408_Mag: CA_Magazine {
        initSpeed = 867;
    };
    class ACE_7Rnd_408_305gr_Mag: 7Rnd_408_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_408_Ball";
        displayName = CSTRING(7Rnd_408_305gr_Mag_Name);
        displayNameShort = CSTRING(7Rnd_408_305gr_Mag_NameShort);
        descriptionShort = CSTRING(7Rnd_408_305gr_Mag_Description);
        initSpeed = 1067;
    };

    class 5Rnd_127x108_Mag;
    class 5Rnd_127x108_APDS_Mag: 5Rnd_127x108_Mag {
        initSpeed = 820;
    };
    class ACE_5Rnd_127x99_Mag: 5Rnd_127x108_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "B_127x99_Ball";
        displayName = CSTRING(5Rnd_127x99_Mag_Name);
        displayNameShort = CSTRING(5Rnd_127x99_Mag_NameShort);
        descriptionShort = CSTRING(5Rnd_127x99_Mag_Description);
        initSpeed = 900;
    };
    class ACE_5Rnd_127x99_API_Mag: 5Rnd_127x108_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_127x99_API";
        displayName = CSTRING(5Rnd_127x99_API_Mag_Name);
        displayNameShort = CSTRING(5Rnd_127x99_API_Mag_NameShort);
        descriptionShort = CSTRING(5Rnd_127x99_API_Mag_Description);
        initSpeed = 900;
    };
    class ACE_5Rnd_127x99_AMAX_Mag: 5Rnd_127x108_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_127x99_Ball_AMAX";
        displayName = CSTRING(5Rnd_127x99_AMAX_Mag_Name);
        displayNameShort = CSTRING(5Rnd_127x99_AMAX_Mag_NameShort);
        descriptionShort = CSTRING(5Rnd_127x99_AMAX_Mag_Description);
        initSpeed = 860;
    };


    class 30Rnd_9x21_Mag: CA_Magazine {
        initSpeed = 430;
    };
    class 30Rnd_9x21_Green_Mag: 30Rnd_9x21_Mag {
        initSpeed = 402;
    };
    class 30Rnd_9x21_Mag_SMG_02: 30Rnd_9x21_Mag {
        initSpeed = 430;
    };
    class 30Rnd_9x21_Mag_SMG_02_Tracer_Green: 30Rnd_9x21_Mag_SMG_02 {
        initSpeed = 402;
    };

    class 10Rnd_50BW_Mag_F: CA_Magazine {
        initSpeed = 552;
    };

    class 11Rnd_45ACP_Mag: CA_Magazine {
        initSpeed = 254;
    };

    class 6Rnd_45ACP_Cylinder : 11Rnd_45ACP_Mag {
        initSpeed = 254;
    };

    class 30Rnd_45ACP_Mag_SMG_01: 30Rnd_9x21_Mag {
        initSpeed = 254;
    };

    class 9Rnd_45ACP_Mag: 30Rnd_45ACP_Mag_SMG_01 {
        initSpeed = 254;
    };

    class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green: 30Rnd_45ACP_Mag_SMG_01 {
        initSpeed = 254;
    };

    class 16Rnd_9x21_Mag: 30Rnd_9x21_Mag {
        initSpeed = 430;
    };
    class 10Rnd_9x21_Mag: 16Rnd_9x21_Mag {
        initSpeed = 430;
    };
    class ACE_16Rnd_9x19_mag: 16Rnd_9x21_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_9x19_Ball";
        displayName = CSTRING(16Rnd_9x19_mag_Name);
        displayNameShort = CSTRING(16Rnd_9x19_mag_NameShort);
        descriptionShort = CSTRING(16Rnd_9x19_mag_Description);
        initSpeed = 370;
    };

    class 10Rnd_762x54_Mag: 10Rnd_762x51_Mag {
        initSpeed = 836;
    };
    class ACE_10Rnd_762x54_Tracer_mag: 10Rnd_762x54_Mag {
        author = ECSTRING(common,ACETeam);
        ammo = "ACE_762x54_Ball_7T2";
        displayName = CSTRING(10Rnd_762x54_Tracer_mag_Name);
        displayNameShort = CSTRING(10Rnd_762x54_Tracer_mag_NameShort);
        descriptionShort = CSTRING(10Rnd_762x54_Tracer_mag_Description);
        initSpeed = 810;
        tracersEvery = 1;
    };

    class 150Rnd_762x54_Box: 150Rnd_762x51_Box {
        initSpeed = 778;
    };

    class 10Rnd_127x54_Mag: CA_Magazine {
        initSpeed = 300;
    };
    
    class 150Rnd_556x45_Drum_Mag_F: CA_Magazine {
        initSpeed = 869;
    };
    
    class 130Rnd_338_Mag: CA_Magazine {
        initSpeed = 807;
    };
    
    class 200Rnd_65x39_Belt: VehicleMagazine {
        initSpeed = 806;
    };
    
    class 20Rnd_556x45_UW_mag: 30Rnd_556x45_Stanag {
        initSpeed = 267;
    };
    
    class 150Rnd_93x64_Mag: CA_Magazine {
        initSpeed = 870;
    };
    class 10Rnd_93x64_DMR_05_Mag: 150Rnd_93x64_Mag {
        initSpeed = 870;
    };
};
