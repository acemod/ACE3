
class CfgMagazines {

    class CA_Magazine;
    class 30Rnd_65x39_caseless_mag: CA_Magazine {
        initSpeed = 760;
    };
    class 100Rnd_65x39_caseless_mag: CA_Magazine {
        initSpeed = 760;
    };
    class 100Rnd_65x39_caseless_mag_Tracer: 100Rnd_65x39_caseless_mag {
        initSpeed = 760;
    };
    class 200Rnd_65x39_cased_Box: 100Rnd_65x39_caseless_mag {
        initSpeed = 760;
    };
    class 30Rnd_65x39_caseless_mag_Tracer: 30Rnd_65x39_caseless_mag {
    };
    class ACE_30Rnd_65x39_caseless_mag_Tracer_Dim: 30Rnd_65x39_caseless_mag_Tracer {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_65x39_Caseless_Tracer_Dim";
        displayName = "$STR_ACE_30Rnd_65x39_caseless_mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_30Rnd_65x39_caseless_mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_30Rnd_65x39_caseless_mag_Tracer_DimDescription";
        picture = "\A3\weapons_f\data\ui\m_30stanag_caseless_yellow_CA.paa";
    };

    class 30Rnd_556x45_Stanag: CA_Magazine {
    };
    class 30Rnd_556x45_Stanag_Tracer_Red: 30Rnd_556x45_Stanag {
    };
    class ACE_30Rnd_556x45_Stanag_Tracer_Dim: 30Rnd_556x45_Stanag_Tracer_Red {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_556x45_Ball_Tracer_Dim";
        displayName = "$STR_ACE_30Rnd_556x45_mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_30Rnd_556x45_mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_30Rnd_556x45_mag_Tracer_DimDescription";
        picture = "\A3\weapons_f\data\ui\m_30stanag_yellow_ca.paa";
    };
    
    class 20Rnd_762x51_Mag: CA_Magazine {
        initSpeed = 833;
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
    class ACE_20Rnd_762x51_Mag_Tracer: 20Rnd_762x51_Mag {  //@todo Green tracers for opfor and yellow tracers for independent
        author = "$STR_ACE_Common_ACETeam";
        ammo = "B_762x51_Tracer_Red";
        displayName = "$STR_ACE_20Rnd_762x51_mag_TracerName";
        displayNameShort = "$STR_ACE_20Rnd_762x51_mag_TracerNameShort";
        descriptionShort = "$STR_ACE_20Rnd_762x51_mag_TracerDescription";
        tracersEvery = 1;
    };

    class ACE_20Rnd_762x51_Mag_Tracer_Dim: ACE_20Rnd_762x51_Mag_Tracer {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_762x51_Tracer_Dim";
        displayName = "$STR_ACE_20Rnd_762x51_mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_20Rnd_762x51_mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_20Rnd_762x51_mag_Tracer_DimDescription";
    };

    class ACE_20Rnd_762x51_Mag_SD: 20Rnd_762x51_Mag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_762x51_Ball_Subsonic";
        displayName = "$STR_ACE_20Rnd_762x51_mag_SDName";
        displayNameShort = "$STR_ACE_20Rnd_762x51_mag_SDNameShort";
        descriptionShort = "$STR_ACE_20Rnd_762x51_mag_SDDescription";
        initSpeed = 325;
    };
    
    class 30Rnd_9x21_Mag: CA_Magazine {
        initSpeed = 450;
    };
    class ACE_30Rnd_9x19_mag: 30Rnd_9x21_Mag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_9x19_Ball";
        displayName = "$STR_ACE_30Rnd_9x19_mag_Name";
        displayNameShort = "$STR_ACE_30Rnd_9x19_mag_NameShort";
        descriptionShort = "$STR_ACE_30Rnd_9x19_mag_Description";
        initSpeed = 370;
    };
    
    class 11Rnd_45ACP_Mag: CA_Magazine {
        initSpeed = 250;
    };
    
    class 6Rnd_45ACP_Cylinder : 11Rnd_45ACP_Mag {
        initSpeed = 250;
    };
    
    class 30Rnd_45ACP_Mag_SMG_01: 30Rnd_9x21_Mag {
        initSpeed = 250;
    };
    
    class 9Rnd_45ACP_Mag: 30Rnd_45ACP_Mag_SMG_01 {
        initSpeed = 250;
    };
    
    class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green: CA_Magazine {
        initSpeed = 250;
    };
    
    class 16Rnd_9x21_Mag: 30Rnd_9x21_Mag {
        initSpeed = 450;
    };
    class ACE_16Rnd_9x19_mag: 16Rnd_9x21_Mag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_9x19_Ball";
        displayName = "$STR_ACE_16Rnd_9x19_mag_Name";
        displayNameShort = "$STR_ACE_16Rnd_9x19_mag_NameShort";
        descriptionShort = "$STR_ACE_16Rnd_9x19_mag_Description";
        initSpeed = 370;
    };
    
    class 10Rnd_762x54_Mag: 10Rnd_762x51_Mag {
        initSpeed = 800;
    };
    
    class 150Rnd_762x54_Box: 150Rnd_762x51_Box {
        initSpeed = 750;
    };
    
    class 150Rnd_93x64_Mag: CA_Magazine {
        initSpeed = 860;
    };
    
    class 10Rnd_127x54_Mag: CA_Magazine {
        initSpeed = 300;
    };
};
